local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local tbl = require("utils.tbl")

local stocks = sbar.add("item", "widgets.stocks", {
    position = "right",
    icon = { drawing = false },
    label = {
        string = icons.loading,
        font = { family = settings.font.numbers }
    },
    update_freq = 900,
    popup = { align = "center", height = 25 }
})

sbar.add("bracket", "widgets.stocks.bracket", { stocks.name }, {
    background = { color = colors.bg1 }
})

sbar.add("item", "widgets.stocks.padding", {
    position = "right",
    width = settings.group_paddings
})

local function load_stocks(stock_data)
    local data = stock_data["Time Series (Daily)"]
    local keys = tbl.keys(data)
    local today = tonumber(data[keys[1]]["4. close"])
    local yesterday = tonumber(data[keys[2]]["4. close"])
    local percent_change = (today - yesterday) / yesterday * 100
    if percent_change == 0 then
        stocks:set({
            icon = { string = icons.stocks.even, drawing = true, color = colors.white },
            label = { string = "0.00%" }
        })
        return
    end
    local icon_value = percent_change > 0 and icons.stocks.up or icons.stocks.down
    local icon_color = percent_change > 0 and colors.green or colors.red
    stocks:set({
        icon = { string = icon_value, drawing = true, color = icon_color },
        label = { string = string.format("%.2f%%", math.abs(percent_change)) }
    })
end

stocks:subscribe({"routine", "forced", "system_woke"}, function ()
    if settings.stocks.api_key then
        local url =
            "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=" ..
            settings.stocks.default_symbol .. "&apikey=" .. settings.stocks.api_key
        sbar.exec("curl \"" .. url .. "\"", load_stocks)
    end
  end)

stocks:subscribe("mouse.clicked", function()
    stocks:set({ popup = { drawing = "toggle" }})
end)

stocks:subscribe("mouse.exited.global", function()
    stocks:set({ popup = { drawing = "off" }})
end)