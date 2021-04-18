--[[

	     AwesomeWM Configuration template

--]]

pcall(require, "luarocks.loader")

-- Standard awesome library
-- 导入必要的库
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Miscellanous awesome library
local menubar = require("menubar")

RC = {} -- global namespace, on top before require any modules
-- 导入用户变量
RC.vars = require("main.user-variables")
modkey = RC.vars.modkey

-- Error handling
require("main.error-handling")

--开机启动的软件
require("main.auto-start")

-- Themes
require("main.theme")

-- -- --

-- Calling All Module Libraries

-- Custom Local Library
-- 导入主函数
local main = {
  -- 布局
  layouts = require("main.layouts"),
  -- 标签
  tags    = require("main.tags"),
  -- 菜单
  menu    = require("main.menu"),
  -- 规则
  rules   = require("main.rules"),
}

-- Custom Local Library: Keys and Mouse Binding
-- 自定义本地库：鼠标与按键绑定
local binding = {
  globalbuttons = require("binding.globalbuttons"),
  clientbuttons = require("binding.clientbuttons"),
  globalkeys    = require("binding.globalkeys"),
  clientkeys    = require("binding.clientkeys"),
  bindtotags    = require("binding.bindtotags")
}

-- Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

-- Menu
RC.mainmenu = awful.menu({ items = main.menu() }) -- in globalkeys
RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu }
)
menubar.utils.terminal = RC.vars.terminal

-- Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Rules
awful.rules.rules = main.rules(
  binding.clientkeys(),
  binding.clientbuttons()
)

-- Signals
require("main.signals")

-- Statusbar: Wibar
--local statusbar = require("statusbar.default.statusbar")
--local statusbar = require("statusbar.stacked.statusbar")
--local statusbar = require("statusbar.vicious.statusbar")
--local statusbar = require("statusbar.lain.statusbar")
--local statusbar = require("statusbar.arrow.statusbar")
local statusbar = require("themes.default.statusbar.statusbar")

statusbar()
