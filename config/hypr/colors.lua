local colors = { background = "rgb(1a1a1a)", color4 = "rgb(33ccff)" }
local cache = os.getenv("XDG_CACHE_HOME") or (os.getenv("HOME") .. "/.cache")
local file = io.open(cache .. "/wal/colors-hyprland.conf", "r")
if file then
    for line in file:lines() do
        local name, value = line:match("^%s*%$([%w_]+)%s*=%s*(.-)%s*$")
        if name and (value:match("^rgb%(%x%x%x%x%x%x%)$")
            or value:match("^rgba%(%x%x%x%x%x%x%x%x%)$")) then
            colors[name] = value
        end
    end
    file:close()
end
return colors
