--[[

      菜单模块

--]]

-- Standard awesome library
local awful = require("awful");
local hotkeys_popup = require("awful.hotkeys_popup").widget;
-- Theme handling library
-- for awesome.icon
local beautiful = require("beautiful");
-- menu
local M = {};
-- module
local _M = {};

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = RC.vars.terminal;

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv("EDITOR") or "nano";
local editor_cmd = terminal .. " -e " .. editor;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- awesome 右键菜单配置
M.awesome = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "Terminal", terminal },
  { "Shutdown/Logout", "oblogout" },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end }
}

M.favorite = {
  { "caja", "caja" },
  { "thunar", "thunar" },
  { "geany", "geany" },
  { "clementine", "clementine" },
  { "firefox", "firefox-bin", awful.util.getdir("config") .. "/firefox.png" },
  { "chromium", "chromium" },
  { "&firefox", "firefox" },
  { "&thunderbird", "thunderbird-bin" },
  { "libreoffice", "libreoffice" },
  { "transmission", "transmission-gtk" },
  { "telegram", "telegram-desktop" },
  { "gimp", "gimp" },
  { "inkscape", "inkscape" },
  { "screenshooter", "xfce4-screenshooter" }
}

M.startup = {
  { "compton", "compton" },
  { "nm-applet", "nm-applet" },
  { "wicd-curses", "wicd-curses" },
  { "wicd-gtk", "wicd-gtk" }
}

-- 办公
M.office = {
  {"有道词典", "youdao-dict"},
  {"Typora", "typora"},
  {"XMind", "xmind"},
  {"WPS 表格", "/usr/bin/et"},
  {"WPS 文字", "/usr/bin/wps"},
  {"WPS 演示", "/usr/bin/wpp"},
  {"WPS PDF", "/usr/bin/wpspdf"},
  {"邮件新闻客户端", "/usr/lib/thunderbird/thunderbird"},

}
-- 互联网
M.internet = {
  {"Firefox", "/usr/lib/firefox/firefox"},
  {"Google Chrome", "/usr/bin/google-chrome-stable"},
  {"腾讯QQ", "/usr/bin/qq"},
  {"Telegram", "telegram-desktop"},

}
-- 影音
M.av = {
  {"YesPlayMusic", "/opt/YesPlayMusic/yesplaymusic"},
  {"网易云音乐", "netease-cloud-music"},
  {"mpv 媒体播放器", "mpv"},
  {"腾讯视频", "/opt/tenvideo/TencentVideo"},

}
-- 开发
M.development = {
  --{"VIM", "vim"},
  --{"NeoVim", "nvim"},
  {"STS", "/home/yixiaobai/opt/sts/SpringToolSuite4"},
  {"visual-studio-code", "/opt/visual-studio-code/code"},
  {"dbeaver", "dbeaver"},
  {"Umbrello", "umbrello5"},
  {"", ""},

}
-- 工具
M.tools = {
  {"系统清理器", "sweeper"},
  {"火焰截图", "flameshot"},
  {"坚果云", "/usr/bin/nutstore"},
  {"百度网盘", "/usr/lib/baidunetdisk/baidunetdisk"},
  {"FileZilla", "filezilla"},
  {"uGet", "uget-gtk"},
  {"Qv2ray", "qv2ray"},
  {"BitTorrent 客户端", "qbittorrent"},
}
-- 图形
M.graphics = {
  { "GNU 图像处理程序", "gimp" },
  {"图像查看器", "gpicview"},
  {"KolourPaint", "kolourpaint"},
  {"Kontrast", "kontrast"},
  {"数字绘画程序", "krita"},
}

-- 游戏
M.geam = {
  {"Steam", "/usr/bin/steam-runtime"},
  {"Hmcl", "hmcl"},

}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", M.awesome, beautiful.awesome_subicon },
    { "open terminal", terminal },
    --{ "tools and startup", M.startup },
    --{ "favorite", M.favorite },
    { "办公", M.office },
    { "互联网", M.internet },
    { "开发", M.development },
    { "影音", M.av },
    { "工具", M.tools },
    { "图形", M.graphics },
    { "游戏", M.geam }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
