-- 开机启动的软件

local awful = require("awful")
              require("awful.autofocus");


-- 开机自启的函数
function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        findme = cmd;
        firstspace = cmd:find(" ");
        if firstspace then
            findme = cmd:sub(0, firstspace-1)
        end
        awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd))
    end
end

run_once({
        "dhcpcd",
        "picom",
        "fcitx5",
        "",
        "",
        "",
        "",
    });
