--[[

    全局按钮模块

]]

-- Standard awesome library
local gears = require("gears");
local awful = require("awful");

local _M = {};

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 全局按钮
-- 您可以使用right click鼠标按钮打开菜单

function _M.get()
  local globalbuttons = gears.table.join(
    awful.button({ }, 3, function () RC.mainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
  )

  return globalbuttons
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
  __call = function(_, ...) return _M.get(...) end
})
