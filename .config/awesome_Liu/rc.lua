--[[

	     AwesomeWM Configuration template

--]]

-- {{{ Required librarie 导入必要的库
-- 判断是否安装了LuaRocks 的软件仓库
pcall(require, "luarocks.loader");

-- Standard awesome library
local gears = require("gears");
local awful = require("awful");

-- Theme handling library
local beautiful = require("beautiful");

-- Miscellanous awesome library
local menubar = require("menubar");

-- 错误处理模块
require("main.error-handling");
-- Themes
--require("main.theme");
-- Signals 标题
require("main.signals");

RC = {};
-- 导入用户变量
RC.vars = require("main.user-variables");

modkey = RC.vars.modkey;

-- 导入主函数
local main = {
	-- 布局
	layouts = require("main.layouts"),
	-- 标签
	tags = require("main.tags"),
	-- 菜单
	menu = require("main.menu"),
	-- 规则
	rules = require("main.rules"),
};

-- Custom Local Library: Keys and Mouse Binding
-- 自定义本地库：鼠标与按键绑定
local binding = {
    globalbuttons = require("binding.globalbuttons"),
    clientbuttons = require("binding.clientbuttons"),
    globalkeys    = require("binding.globalkeys"),
    bindtotags    = require("binding.bindtotags"),
    clientkeys    = require("binding.clientkeys")
  }

-- layouts 调用
RC.layouts = main.layouts();
-- tags 调用
RC.tags = main.tags();

---- Menu
RC.mainmenu = awful.menu({
	items = main.menu()
    });

RC.launcher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = RC.mainmenu
    });

menubar.utils.terminal = RC.vars.terminal;

-- Mouse and Key bindings
RC.globalkeys = binding.globalkeys();
RC.globalkeys = binding.bindtotags(RC.globalkeys);

-- Set root
-- 全局按钮
root.buttons(binding.globalbuttons());
root.keys(RC.globalkeys);

mykeyboardlayout = awful.widget.keyboardlayout();

-- Statusbar : Wibar
-- 状态栏框架
require("deco.statusbar");

-- Rules
awful.rules.rules = main.rules(
  binding.clientbuttons(),
  binding.clientkeys()
)

-- Signals
require("main.signals");

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
--打开具有匹配名称的客户端时，打开其应用程序的热键帮助小部件(例如：VIM )
require("awful.hotkeys_popup.keys");
-- }}}

-- {{{ Autostart windowless processes
-- 自动启动无窗口的任务
local function run_once(cmd_arr)
	for _, cmd in ipairs(cmd_arr) do
		findme = cmd
		firstspace = cmd:find(" ")
		if firstspace then
			findme = cmd:sub(0, firstspace-1)
		end
		awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd))
	end
end

-- 配置开机自动启动的软件
run_once({"blueman-applet"});
run_once({"fcitx5"});
run_once({"pasystray"});
run_once({"nm-applet"});
run_once({"picom"});
-- }}}
