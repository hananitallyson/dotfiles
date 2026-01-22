-- ~/.config/nvim/lua/plugins/terminal.lua
local Terminal = {}

local state = { floating = { buf = nil, win = nil } }

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = opts.buf
  if not buf or not vim.api.nvim_buf_is_valid(buf) then
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)
  return { buf = buf, win = win }
end

local function toggle_terminal()
  local current_dir = vim.fn.expand("%:p:h") -- pega a pasta do buffer atual

  if not state.floating.win or not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    vim.cmd("lcd " .. current_dir) -- muda o diretório local do terminal

    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
    return
  end

  -- Foca a janela do terminal e entra no modo inserção automaticamente
  vim.api.nvim_set_current_win(state.floating.win)
  vim.cmd("startinsert")

  -- Mapeia <esc><esc> para fechar o terminal flutuante
  vim.keymap.set("t", "<esc><esc>", function()
    vim.cmd("stopinsert") -- sai do modo inserção
    if state.floating.win and vim.api.nvim_win_is_valid(state.floating.win) then
      vim.api.nvim_win_hide(state.floating.win) -- fecha o floating
    end
  end, { noremap = true, silent = true, buffer = state.floating.buf })
end

-- Comando do Neovim
vim.api.nvim_create_user_command("Floatterminal", toggle_terminal, {})

-- Atalho para abrir/fechar
vim.keymap.set("n", "<leader>tt", toggle_terminal, { noremap = true, silent = true })

return Terminal
