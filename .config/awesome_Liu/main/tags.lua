--[[

    标签模块

--]]

local awful = require("awful");

local _M = {};

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

    tags = {};

    local tagpairs = {
	    names = {
		"壹",
		"贰",
		"叁",
		"肆",
		"伍",
		"陆",
		"柒"
	    },

    -- 指定每个标签的显示格式
    layout = {
	    RC.layouts[1],
	    RC.layouts[1],
	    RC.layouts[1],
	    RC.layouts[1],
	    RC.layouts[1],
	    RC.layouts[1],
	    RC.layouts[1]
      }
    }

    awful.screen.connect_for_each_screen(function(s)
	tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)

        -- tags[s] = awful.tag(
          -- RC.layouts[1] 调用的是布局模块中的数组。
          -- {"壹", "贰", "叁", "肆", "伍", "陆", "柒"},s,RC.layouts[1]

          --  )
     end)

  return tags;
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
  {},
  { __call = function(_, ...) return _M.get(...) end }
)
