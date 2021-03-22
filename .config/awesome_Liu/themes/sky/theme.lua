-------------------------------
--    "Sky" awesome theme    --
--  By Andrei "Garoth" Thorp --
-------------------------------
-- If you want SVGs and extras, get them from garoth.com/awesome/sky-theme

local awful                               = require("awful");
local gears                               = require("gears");
local wibox                               = require("wibox");
local lain                                = require("lain");
local theme_assets                        = require("beautiful.theme_assets")
local xresources                          = require("beautiful.xresources")
local dpi                                 = xresources.apply_dpi
--local themes_path = require("gears.filesystem").get_themes_dir()
local themes_path                         = ".config/awesome/themes/sky/";
local os, math, string                    = os, math, string;

-- BASICS
local theme                               = {}
theme.dir                                 = os.getenv("HOME") .. "/" .. themes_path ;
theme.font                                = "Source Han Sans Normal 12"
-- 前景色
theme.fg_normal                           = "#000000"
theme.fg_focus                            = "#FF0000"
theme.fg_urgent                           = "#2e3436"
theme.fg_minimize                         = "#2e3436"
-- 背景色
theme.bg_focus                            = "#8E8E90"
theme.bg_normal                           = "#3a4750"
theme.bg_urgent                           = "#fce94f"
theme.bg_minimize                         = "#0067ce"
-- systray 系统托盘
theme.bg_systray                          = "#FFFFFF"

theme.useless_gap                         = dpi(2)
theme.border_width                        = dpi(1)
theme.border_normal                       = "#dae3e0"
theme.border_focus                        = "#0779E4"
theme.border_marked                       = "#eeeeec"

-- IMAGES
theme.layout_fairh                        = themes_path .. "layouts/fairh.png"
theme.layout_fairv                        = themes_path .. "layouts/fairv.png"
theme.layout_floating                     = themes_path .. "layouts/floating.png"
theme.layout_magnifier                    = themes_path .. "layouts/magnifier.png"
theme.layout_max                          = themes_path .. "layouts/max.png"
theme.layout_fullscreen                   = themes_path .. "layouts/fullscreen.png"
theme.layout_tilebottom                   = themes_path .. "layouts/tilebottom.png"
theme.layout_tileleft                     = themes_path .. "layouts/tileleft.png"
theme.layout_tile                         = themes_path .. "layouts/tile.png"
theme.layout_tiletop                      = themes_path .. "layouts/tiletop.png"
theme.layout_spiral                       = themes_path .. "layouts/spiral.png"
theme.layout_dwindle                      = themes_path .. "layouts/dwindle.png"
theme.layout_cornernw                     = themes_path .. "layouts/cornernw.png"
theme.layout_cornerne                     = themes_path .. "layouts/cornerne.png"
theme.layout_cornersw                     = themes_path .. "layouts/cornersw.png"
theme.layout_cornerse                     = themes_path .. "layouts/cornerse.png"

theme.awesome_icon                        = themes_path .. "awesome-icon.png"

-- from default for now...
theme.menu_submenu_icon                   = themes_path .. "submenu.png"

-- Generate taglist squares:
local taglist_square_size                 = dpi(4)
theme.taglist_squares_sel                 = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel               = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- MISC
theme.wallpaper                           = themes_path .. "wall.png"
theme.taglist_squares                     = "true"
theme.titlebar_close_button               = "true"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- Define the image to load
theme.titlebar_close_button_normal        = themes_path .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus         = themes_path .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal     = themes_path .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus      = themes_path .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive  = themes_path .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive   = themes_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active    = themes_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active     = themes_path .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive  = themes_path .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive   = themes_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active    = themes_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active     = themes_path .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active   = themes_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active    = themes_path .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = themes_path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = themes_path .. "titlebar/maximized_focus_active.png"

--theme.widget_net                                 = themes_path .. "icons/";
theme.widget_net_down                                 = themes_path .. "icons/arrow_downward.png";
theme.widget_net_up                                 = themes_path .. "icons/arrow_upward.png";

local markup            = lain.util.markup;
local separators        = lain.util.separators;
-- {{{
--网速
local neticon = wibox.widget.imagebox(theme.widget_net);
local netIconDown = wibox.widget.imagebox(theme.widget_net_down);
local netIconUp = wibox.widget.imagebox(theme.widget_net_up);
local netDown = lain.widget.net({
        settings = function()
            widget:set_markup(markup.font(theme.font, markup("#000000", net_now.received .. "kb/s")))
        end
    })
--local netUp = lanin.widget.net({
--        settings = function()
--            widget:set_markup(markup.font(theme.font, markup("#000000", net_now.sent .. "kb/s")))
--        end
--    })
-- }}}

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock(" %H:%M:%S", 01);

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

-- 设置壁纸
function theme.setWallpaper()
    -- Wallpaper
    local wallpaper = theme.wallpaper;
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s);
    end
    gears.wallpaper.maximized(wallpaper, s ,true);
end

function theme.connect(s)

    -- Wallpaper
    theme.setWallpaper();

    -- Each screen has its own tag table.
    --awful.tag({ "壹", "贰", "叁", "肆", "伍", "陆", "柒" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- 网速
            --wibox.container.background(netIconDown),
            wibox.container.background(netDown.widget),
            --wibox.container.background(netIconUp),
            --wibox.container.background(netUp.widget),
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
