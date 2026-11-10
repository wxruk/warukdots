local config_dir = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_dir .. "?.lua;" .. package.path

require("monitors")
require("input")
require("lookandfeel")
require("binds")

--that is needed for dots work, do not change if u do not want to break hyprland
hl.on("hyprland.start", function()
    hl.exec_cmd('bash "' .. config_dir .. 'autostart.sh"')
    hl.exec_cmd("waybar")
end)
