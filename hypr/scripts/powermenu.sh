#!/usr/bin/env fish

set chosen (printf "Shutdown\nReboot\nLogout\nSuspend\nLock" | tofi --prompt-text "Power: ")

switch $chosen
  case "Shutdown"
    systemctl poweroff
  case "Reboot"
    systemctl reboot
  case "Logout"
    hyprctl dispatch exit
  case "Suspend"
    systemctl suspend
  case "Lock"
    hyprlock
end
