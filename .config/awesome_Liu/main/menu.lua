--[[

      菜单模块

--]]

-- Standard awesome library
local awful = require("awful");
local hotkeys_popup = require("awful.hotkeys_popup").widget;
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon
-- menu
local M = {};
-- module
local _M = {};

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
local terminal = RC.vars.terminal;

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv("EDITOR") or "nano";
local editor_cmd = terminal .. " -e " .. editor;
-- 配置值
M.awesome = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end},
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "Terminal", terminal },
  { "Shutdown/Logout", "oblogout" },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end }
}
-- 自定义菜单
M.favorite = {
  { "caja", "caja" },
  { "thunar", "thunar" },
  { "geany", "geany" },
  { "clementine", "clementine" },
  { "firefox", "firefox", awful.util.getdir("config") .. "/firefox.png" },
  { "chromium", "chromium" },
  { "&firefox", "firefox" },
  { "&thunderbird", "thunderbird" },
  { "libreoffice", "libreoffice" },
  { "transmission", "transmission-gtk" },
  { "gimp", "gimp" },
  { "inkscape", "inkscape" },
  { "screenshooter", "xfce4-screenshooter" }
}
-- 自定义菜单
M.network_main = {
  { "wicd-curses", "wicd-curses" },
  { "wicd-gtk", "wicd-gtk" }
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", M.awesome, beautiful.awesome_subicon },
    { "open terminal", terminal },
    -- {{{  自定义菜单
    { "network", M.network_main },
    { "favorite", M.favorite }
    -- }}}
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
  {},
  { __call = function(_, ...) return _M.get(...) end }
)
