local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = { "LuaTree", "vista", "dbui" }

local colors = require("modules.statusline.colors")
local mode_color = require("modules.statusline.mode_color")

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
        return true
    end
    return false
end

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.left[1] = {
    FirstElement = {
        provider = function()
            return "│"
        end,
        highlight = { mode_color[vim.fn.mode()], "#000000" },
    },
}
gls.left[2] = {
    ViMode = {
        provider = function()
            vim.api.nvim_command("hi GalaxyViMode guibg=#000000 guifg=" .. mode_color[vim.fn.mode()])
            return "     "
        end,
        separator = "  ",
        separator_highlight = {
            "#000000",
            function()
                if not buffer_not_empty() then
                    return colors.bg
                end
                return colors.bg
            end,
        },
        highlight = { colors.grey, colors.bg, "bold" },
    },
}
gls.left[3] = {
    FileIcon = {
        separator = " ",
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg },
    },
}
gls.left[4] = {
    FileName = {
        provider = { "FileSize" },
        condition = buffer_not_empty,
        separator = " ",
        separator_highlight = { colors.purple, colors.bg },
        highlight = { colors.magenta, colors.bg },
    },
}

gls.left[3] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        condition = buffer_not_empty,
        highlight = { colors.orange, colors.bg },
    },
}
gls.left[4] = {
    GitBranch = {
        provider = "GitBranch",
        separator = " ",
        separator_highlight = { colors.purple, colors.bg },
        condition = buffer_not_empty,
        highlight = { colors.grey, colors.bg },
    },
}

gls.left[5] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        -- separator = ' ',
        -- separator_highlight = {colors.purple,colors.bg},
        icon = "  ",
        highlight = { colors.green, colors.bg },
    },
}
gls.left[6] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        -- separator = ' ',
        -- separator_highlight = {colors.purple,colors.bg},
        icon = "  ",
        highlight = { colors.blue, colors.bg },
    },
}
gls.left[7] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        -- separator = ' ',
        -- separator_highlight = {colors.purple,colors.bg},
        icon = "  ",
        highlight = { colors.red, colors.bg },
    },
}
gls.left[8] = {
    LeftEnd = {
        provider = function()
            return " "
        end,
        separator = " ",
        separator_highlight = { colors.purple, colors.bg },
        highlight = { colors.purple, colors.bg },
    },
}
gls.left[9] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = { colors.red, colors.bg },
    },
}
gls.left[10] = {
    Space = {
        provider = function()
            return ""
        end,
    },
}
gls.left[11] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = { colors.yellow, colors.bg },
    },
}
gls.left[12] = {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "   ",
        highlight = { colors.blue, colors.bg },
    },
}
gls.left[13] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "   ",
        highlight = { colors.orange, colors.bg },
    },
}

-- separator
gls.short_line_left[1] = {
    BufferType = {
        provider = "FileTypeName",
        separator = " ",
        separator_highlight = { colors.purple, colors.bg },
        highlight = { colors.grey, colors.bg },
    },
}

gls.short_line_left[1] = {
    LeftEnd = {
        provider = function()
            return " "
        end,
        separator = " ",
        separator_highlight = { colors.purple, colors.bg },
        highlight = { colors.purple, colors.bg },
    },
}
