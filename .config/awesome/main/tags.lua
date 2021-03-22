-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
  local tags = {}

  local tagpairs = {
--  names  = { "term", "net", "edit", "place", 5, 6, 7, 8, 9 },
    names  = {
      "壹",
      "贰",
      "叁",
      "肆",
      "伍",
      "陆",
      "柒"
    },
    layout = {
      RC.layouts[2], RC.layouts[2], RC.layouts[4],
      RC.layouts[5], RC.layouts[6], RC.layouts[12],
      RC.layouts[9]
    }
  }

  awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
  end)
  
  return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
  {},
  { __call = function(_, ...) return _M.get(...) end }
)
