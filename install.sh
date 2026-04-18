#!/bin/bash

# Abortar em caso de erro
set -e

# Definir o diretório onde o script está localizado
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$EUID" -eq 0 ]; then
    echo "Erro: Não execute este script como root (o sudo será solicitado quando necessário)."
    exit 1
fi

echo "--- Iniciando a instalação e configuração ---"

# 1. Base e Git
sudo pacman -S --needed --noconfirm base-devel git

# 2. Instalar pacotes oficiais (Adicionado 'hyprland' que faltava)
sudo pacman -S --needed --noconfirm \
    hyprland amd-ucode mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon \
    wayland wayland-protocols xdg-user-dirs meson scdoc libxkbcommon \
    freetype2 harfbuzz cairo pango \
    greetd greetd-tuigreet \
    fish vim neovim \
    waybar swww mako nwg-look \
    thunar gvfs udiskie \
    ttf-martian-mono-nerd noto-fonts noto-fonts-emoji noto-fonts-cjk \
    imv mpv zathura-pdf-mupdf \
    wl-clipboard cliphist grim slurp \
    iwd openssh systemd-networkd systemd-resolved curl \
    pamixer pavucontrol \
    ripgrep fastfetch stow brightnessctl tar zip unzip

# 3. Instalar paru (AUR helper)
if ! command -v paru &>/dev/null; then
    echo "--- Instalando Paru ---"
    PARU_TEMP="$(mktemp -d)"
    git clone https://aur.archlinux.org/paru.git "$PARU_TEMP"
    cd "$PARU_TEMP"
    makepkg -si --noconfirm
    cd "$SCRIPT_DIR"
    rm -rf "$PARU_TEMP"
fi

# 4. Pacotes AUR
paru -S --needed --noconfirm asdf-vm bibata-cursor-theme-bin google-chrome tofi

# 5. Limpeza de Display Managers antigos
if pacman -Qs sddm >/dev/null; then
    sudo systemctl disable sddm 2>/dev/null || true
    sudo pacman -Rns --noconfirm sddm
fi

# 6. Configurar Greetd (Corrigido para usar o binário correto do Hyprland)
sudo mkdir -p /etc/greetd
sudo tee /etc/greetd/config.toml >/dev/null <<EOF
[terminal]
vt = 1

[default_session]
command = "tuigreet --time --cmd Hyprland"
user = "greeter"
EOF

sudo systemctl enable greetd

# 7. Graphite GTK Theme
if [ ! -d "/usr/share/themes/Graphite-dark" ]; then
    GRAPHITE_TEMP="$(mktemp -d)"
    git clone https://github.com/vinceliuice/Graphite-gtk-theme.git "$GRAPHITE_TEMP"
    cd "$GRAPHITE_TEMP"
    ./install.sh -l --tweaks black rimless
    cd "$SCRIPT_DIR"
    rm -rf "$GRAPHITE_TEMP"
fi

# 8. YAMIS Icon Set
if [ ! -d "/usr/share/icons/YAMIS" ]; then
    YAMIS_TEMP="$(mktemp -d)"
    git clone https://github.com/googIyEYES/YAMIS.git "$YAMIS_TEMP"
    sudo mkdir -p /usr/share/icons
    sudo cp -r "$YAMIS_TEMP" /usr/share/icons/YAMIS
    rm -rf "$YAMIS_TEMP"
fi

# 9. Configurar Fish Shell
FISH_PATH="$(command -v fish)"
if ! grep -q "$FISH_PATH" /etc/shells; then
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi

if [ "$SHELL" != "$FISH_PATH" ]; then
    chsh -s "$FISH_PATH"
fi

# 10. Stow Dotfiles
echo "--- Aplicando dotfiles com GNU Stow ---"
cd "$SCRIPT_DIR"
# Garante que o stow não tente linkar o próprio script ou README
stow .

echo "--- Setup concluído! Reinicie o sistema. ---"
