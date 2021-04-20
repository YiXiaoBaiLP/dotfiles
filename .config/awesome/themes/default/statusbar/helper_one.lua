-- {{{ Required libraries
-- Standard awesome library
local awful     = require("awful");
local beautiful = require("beautiful");

-- Wibox handling library
local wibox = require("wibox");
local lain  = require("lain");

-- Custom Local Library
require("themes.default.statusbar.lain");
local gmc = require("themes.gmc");
-- }}}

-- Separators lain
local separators  = lain.util.separators;

-- shortcuts
local setbg = wibox.widget.background;
local setar = separators.arrow_right;
local setal = separators.arrow_left;

-- 下面所用的变量
local cws = clone_widget_set;
local cis = clone_icon_set;

-- 下面所用的图片资源
local icon_example = wibox.widget.imagebox(beautiful.widget_example);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local WB = wibox_package;

-- Create a textclock widget
-- 配置右上角的时间显示
mytextclock = wibox.widget.textclock("%Y-%m-%d %H:%M:%S", 1);

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout();

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- 左上角显示的内容
function WB.add_widgets_top_left (s)
  return { -- Left widgets
    layout = wibox.layout.fixed.horizontal,
    RC.launcher,
    WB.spacer,
    s.taglist,
    WB.spacer,
    --WB.arrow_dr,  WB.arrow_rd,
    WB.spacer,
    s.promptbox,
  }
end

-- 右上角显示的内容
function WB.add_widgets_top_right (s)
  return { -- Right widgets
    layout = wibox.layout.fixed.horizontal,

    --setar("alpha",             gmc.color['blue500']),
    --setbg(cis.weather,         gmc.color['blue500']),
    --setbg(cws.weather,         gmc.color['blue500']),
    --setar(gmc.color['blue500'], "alpha"),

    -- 空格
    WB.spacer,
    setal("alpha", gmc.color['blue700']),
    setal(gmc.color['blue700'], gmc.color['blue500']),
    -- 下载图标
    setbg(cis.netdown, gmc.color['blue500']),
    setbg(cws.netdowninfo, gmc.color['blue500']),
    -- 上传图标
    setal(gmc.color['blue500'], gmc.color['blue700']),
    setbg(cis.netup, gmc.color['blue700']),
    setbg(cws.netupinfo, gmc.color['blue700']),
    -- 内存使用量
    setal(gmc.color['blue700'], gmc.color['blue500']),
    setbg(cis.mem, gmc.color['blue500']),
    setbg(cws.mem, gmc.color['blue500']),
    -- CPU 占用
    setal(gmc.color['blue500'], gmc.color['blue700']),
    setbg(cis.cpu, gmc.color['blue700']),
    setbg(cws.cpu, gmc.color['blue700']),
    -- cpu 温度
    setal(gmc.color['blue700'], gmc.color['blue500']),
    setbg(cis.temp, gmc.color['blue500']),
    setbg(cws.temp, gmc.color['blue500']),

    -- 音量
    setal(gmc.color['blue500'], gmc.color['blue700']),
    setbg(cis.volume_dynamic, gmc.color['blue700']),
    setbg(cws.volumewidget, gmc.color['blue700']),
    -- 硬盘
    -- setal(gmc.color['blue700'], gmc.color['blue500']),
    -- setbg(cis.disk, gmc.color['blue500']),
    -- setbg(cws.disk_bar_widget, gmc.color['blue500']),
    -- 电池
    setal(gmc.color['blue700'], gmc.color['blue500']),
    setbg(cis.battery, gmc.color['blue500']),
    setbg(cws.battery_bar_widget, gmc.color['blue500']),

    setal(gmc.color['blue500'], gmc.color['blue700']),
    setal(gmc.color['blue700'], "alpha"),
    WB.spacer,
    WB.arrow_dl,
    WB.arrow_ld,
    --mykeyboardlayout,
    wibox.widget.systray(),
    mytextclock,
    s.layoutbox,
  }
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WB.generate_wibox_one (s)
  -- layout: l_left, nil, l_right

  -- Create the wibox
  s.wibox_top_top = awful.wibar({
    position = "top",
    screen = s,
    height = "40",
    widget = s.tasklist
  })

  -- Add widgets to the wibox
  s.wibox_top_top:setup {
    layout = wibox.layout.align.horizontal,
    WB.add_widgets_top_left (s),
    s.tasklist,
    WB.add_widgets_top_right (s),
  }
end

function WB.generate_wibox_tasklist (s)
  -- layout: tasklist

  -- Create the wibox
  s.wibox_top_bottom = awful.wibar({
    position = "bottom",
    screen = s,
    height = "40",
    widget = s.tasklist
  })
end
