local colors = require("modules.statusline.colors")

local mode_color = {
    n = "aquamarine",
    i = colors.green,
    v = colors.blue,
    [""] = colors.blue,
    V = colors.blue,
    c = colors.purple,
    no = colors.magenta,
    s = colors.green,
    S = colors.green,
    [""] = colors.green,
    ic = colors.yellow,
    R = colors.red,
    Rv = colors.red,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ["r?"] = colors.cyan,
    ["!"] = colors.red,
    t = colors.red,
}
return mode_color
