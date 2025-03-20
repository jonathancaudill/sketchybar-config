local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  height = 37,
  color = colors.bar.bg,
  padding_right = 2,
  padding_left = 2,
  notch_width = 400,
  topmost = true,
  blur_radius = 30
})
