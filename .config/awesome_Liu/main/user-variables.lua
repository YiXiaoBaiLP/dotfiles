--[[

    用户变量

--]]

-- 获取家目录
local home = os.getenv("HOME");

-- 定义相关变量
local _M = {

	modkey = "Mod4",
	altkey = "Mod1",
	-- 终端 rxvt-unicode软件包
	terminal = "urxvt",
	-- 主题名称
	chosen_theme = "sky",
	-- 编辑器
	editor = "nvim",
	gui_editor = "nvim-qt",
	-- 浏览器
	browser = "google-chrome-stable",
};

return _M;
