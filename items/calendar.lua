local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local cal_up = sbar.add("item", {
    position = "right",
    padding_left = -5,
    width = 0,
    label = {
      color = colors.white,
      font = {
        family = settings.font.numbers,
        size = 11.0
      }
    },
    y_offset = 6
  })

local cal_down = sbar.add("item", {
    position = "right",
    padding_left = -5,
    label = {
      color = colors.white,
      font = {
        family = settings.font.numbers,
        size = 11.0
      }
    },
    y_offset = -6
  })

-- Double border for calendar using a single item bracket
local cal_bracket = sbar.add("bracket", { cal_up.name, cal_down.name }, {
  background = {
    color = colors.transparent,
    height = 30,
    border_color = colors.grey
  }
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = 18 })

cal_bracket:subscribe({ "forced", "routine", "system_woke" }, function(env)
    local icon = string.format("%s %d", os.date("%a %b"), tonumber(os.date("%d")))
    local label = string.format("%d:%s", tonumber(os.date("%I")), os.date("%M %p"))
    cal_up:set({ label = { string = icon } })
    cal_down:set({ label = { string = label } })
  end)

local function click_event(env)
  sbar.exec("open https://calendar.google.com")
end

cal_up:subscribe("mouse.clicked", click_event)
cal_down:subscribe("mouse.clicked", click_event)
