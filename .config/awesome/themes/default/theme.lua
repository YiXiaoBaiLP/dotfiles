local awful = require("awful")
awful.util = require("awful.util")
local gmc = require("themes.gmc")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

theme_path = awful.util.getdir("config") .. "/themes/default/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = {}

-- elements
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

theme.font          = "文泉驿等宽微米黑 12" -- "Tamsyn 10" -- "Sans 8"
theme.taglist_font  = "文泉驿等宽微米黑 12"

theme.bg_normal     = gmc.color['white']     .. "cc"
theme.bg_focus      = gmc.color['red300']    .. "cc"
theme.bg_urgent     = gmc.color['orange900'] .. "cc"
theme.bg_minimize   = gmc.color['grey500']   .. "cc"
theme.bg_systray    = gmc.color['grey100']   .. "cc"

theme.fg_normal     = gmc.color['black']
theme.fg_focus      = gmc.color['white']
theme.fg_urgent     = gmc.color['white']
theme.fg_minimize   = gmc.color['white']

-- 边距
theme.useless_gap   = dpi(2)
-- 边框的宽度
theme.border_width  = dpi(2)

theme.border_normal = gmc.color['blue500']   .. "cc"
theme.border_focus  = gmc.color['red300']    .. "cc"
theme.border_marked = gmc.color['orange500'] .. "cc"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:

theme.taglist_bg_focus = gmc.color['red500'] .. "cc"
--theme.taglist_bg_focus = "png:" .. theme_path .. "misc/copycat-holo/taglist_bg_focus.png"
theme.taglist_fg_focus = gmc.color['white']


theme.tasklist_bg_normal = gmc.color['white']    .. "88"
--theme.tasklist_bg_normal = "png:" .. theme_path .. "misc/copycat-holo/bg_focus.png"
theme.tasklist_bg_focus  = gmc.color['red300']   .. "88"
--theme.tasklist_bg_focus  = "png:" .. theme_path .. "misc/copycat-holo/bg_focus_noline.png"
theme.tasklist_fg_focus  = gmc.color['black']

theme.titlebar_bg_normal = gmc.color['white']   .. "cc"
theme.titlebar_bg_focus  = gmc.color['white']   .. "cc"
theme.titlebar_fg_focus  = gmc.color['black']   .. "cc"

-- Generate taglist squares:
local taglist_square_size = dpi(7)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, gmc.color['black']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, gmc.color['white']
)

-- Display the taglist squares

-- override
theme.taglist_squares_sel      = theme_path .. "taglist/square_sel.png"
theme.taglist_squares_unsel    = theme_path .. "taglist/square_unsel.png"

-- alternate override
-- theme.taglist_squares_sel   = theme_path .. "taglist/copycat-blackburn/square_sel.png"
-- theme.taglist_squares_unsel = theme_path .. "taglist/copycat-blackburn/square_unsel.png"
-- theme.taglist_squares_sel   = theme_path .. "taglist/copycat-zenburn/squarefz.png"
-- theme.taglist_squares_unsel = theme_path .. "taglist/copycat-zenburn/squareza.png"


-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon  = theme_path .. "misc/submenu.png"

theme.menu_height = 30      -- dpi(15)
theme.menu_width  = 200     -- dpi(100)
--theme.menu_context_height = 20

theme.menu_bg_normal = gmc.color['white']  .. "cc"
theme.menu_bg_focus  = gmc.color['red300'] .. "cc"
theme.menu_fg_focus  = gmc.color['black']

theme.menu_border_color = gmc.color['blue500'] .. "cc"
theme.menu_border_width = 1

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- titlebar

local titleIconDir = ""

-- copycat-copland

titleIconDir = theme_path .. "titlebar/"

-- titleIconDir = titleIconDir .. "zenburn/"
-- titleIconDir = titleIconDir .. "copycat-copland/"
-- titleIconDir = titleIconDir .. "default/"

-- Define the image to load
theme.titlebar_close_button_normal              = titleIconDir .. "close_normal.png"
theme.titlebar_close_button_focus               = titleIconDir .. "close_focus.png"

theme.titlebar_minimize_button_normal           = titleIconDir .. "minimize_normal.png"
theme.titlebar_minimize_button_focus            = titleIconDir .. "minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive     = titleIconDir .. "ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = titleIconDir .. "ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = titleIconDir .. "ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = titleIconDir .. "ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = titleIconDir .. "sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = titleIconDir .. "sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = titleIconDir .. "sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = titleIconDir .. "sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = titleIconDir .. "floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = titleIconDir .. "floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = titleIconDir .. "floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = titleIconDir .. "floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = titleIconDir .. "maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = titleIconDir .. "maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = titleIconDir .. "maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = titleIconDir .. "maximized_focus_active.png"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- layout
-- You can use your own layout icons like this:

local layoutIconDir = theme_path .. "layouts/"

-- default awful related
theme.layout_dwindle        = layoutIconDir .. "dwindle.png"
theme.layout_fairh          = layoutIconDir .. "fairh.png"
theme.layout_fairv          = layoutIconDir .. "fairv.png"
theme.layout_floating       = layoutIconDir .. "floating.png"
theme.layout_magnifier      = layoutIconDir .. "magnifier.png"
theme.layout_max            = layoutIconDir .. "max.png"
theme.layout_spiral         = layoutIconDir .. "spiral.png"
theme.layout_tilebottom     = layoutIconDir .. "tilebottom.png"
theme.layout_tileleft       = layoutIconDir .. "tileleft.png"
theme.layout_tile           = layoutIconDir .. "tile.png"
theme.layout_tiletop        = layoutIconDir .. "tiletop.png"

theme.layout_fullscreen     = layoutIconDir .. "fullscreen.png"
theme.layout_cornernw       = layoutIconDir .. "cornernw.png"
theme.layout_cornerne       = layoutIconDir .. "cornerne.png"
theme.layout_cornersw       = layoutIconDir .. "cornersw.png"
theme.layout_cornerse       = layoutIconDir .. "cornerse.png"

-- lain related
theme.layout_termfair          = layoutIconDir .. "fairh.png"
theme.layout_uselessfair       = layoutIconDir .. "fairv.png"
theme.layout_uselessfairh      = layoutIconDir .. "fairh.png"
theme.layout_uselessdwindle    = layoutIconDir .. "dwindle.png"
theme.layout_uselesstile       = layoutIconDir .. "tile.png"
theme.layout_uselesstiletop    = layoutIconDir .. "tiletop.png"
theme.layout_uselesstileleft   = layoutIconDir .. "tileleft.png"
theme.layout_uselesstilebottom = layoutIconDir .. "tilebottom.png"
theme.layout_uselesspiral      = layoutIconDir .. "spiral.png"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- icons
local icondir = ""

-- Fort Awesome

icondir = theme_path .. "icons/fontawesome/png40/"

theme.widget_example      = icondir .. "cat.png"
theme.widget_wifi         = icondir .. "wifi.png"
theme.widget_temp         = icondir .. "thermometer-half.png"
theme.widget_uptime       = icondir .. "charging-station.png"
theme.widget_cpu          = icondir .. "microchip.png"
theme.widget_fs           = icondir .. "hdd.png"
theme.widget_mem          = icondir .. "memory.png"
theme.widget_note         = icondir .. "volume-mute.png"
theme.widget_note_on      = icondir .. "music.png"
theme.widget_batt         = icondir .. "battery-full.png"
theme.widget_clock        = icondir .. "clock.png"
theme.widget_vol          = icondir .. "volume-up.png"
theme.widget_weather      = icondir .. "cloud.png"
theme.widget_netdown      = icondir .. "download.png"
theme.widget_netup        = icondir .. "upload.png"

theme.monitor_disk        = icondir .. "hdd.png"
theme.monitor_vol         = icondir .. "volume-up.png"
theme.monitor_vol_low     = icondir .. "volume-down.png"
theme.monitor_vol_no      = icondir .. "volume-off.png"
theme.monitor_vol_mute    = icondir .. "volume-mute.png"

theme.monitor_ac          = icondir .. "charging-station.png"
theme.monitor_bat         = icondir .. "battery-three-quarters.png"
theme.monitor_bat_low     = icondir .. "battery-quarters.png"
theme.monitor_bat_no      = icondir .. "battery-empty.png"

theme.wallpaper          = theme_path .. "background.jpg"
theme.awesome_icon       = theme_path .. "launcher/logo20_arch.png"
theme.awesome_subicon    = theme_path .. "launcher/logo20_arch.png"

return theme


