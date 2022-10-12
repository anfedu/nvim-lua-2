local keymap = vim.api.nvim_set_keymap

function _G.check_backspace()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match("%s")) and true
end

local set_keybindings = function()
    local noremap_silent = { noremap = true, silent = true }
    local noremap_silent_expr = { noremap = true, silent = true, expr = true }
    local noremap_nosilent = { noremap = true, silent = false }
    local remap_silent = { noremap = false, silent = true }
    local remap_nosilent = { noremap = false, silent = true }

    local keybindings = {
        -- Buffers
        { "n", "<C-t>", "<CMD>tabnew<CR>", noremap_silent },
        { "n", "<C-Right>", "<CMD>BufferNext<CR>", noremap_silent },
        { "n", "<C-Left>", "<CMD>BufferPrevious<CR>", noremap_silent },
        { "n", "<leader>1", "<CMD>BufferGoto 1<CR>", noremap_silent },
        { "n", "<leader>2", "<CMD>BufferGoto 2<CR>", noremap_silent },
        { "n", "<leader>3", "<CMD>BufferGoto 3<CR>", noremap_silent },
        { "n", "<leader>4", "<CMD>BufferGoto 4<CR>", noremap_silent },
        { "n", "<leader>5", "<CMD>BufferGoto 5<CR>", noremap_silent },
        { "n", "<leader>6", "<CMD>BufferGoto 6<CR>", noremap_silent },
        { "n", "<leader>7", "<CMD>BufferGoto 7<CR>", noremap_silent },
        { "n", "<leader>8", "<CMD>BufferGoto 8<CR>", noremap_silent },
        { "n", "<leader>9", "<CMD>BufferGoto 9<CR>", noremap_silent },
        { "n", "<leader>0", "<CMD>BufferLast<CR>", noremap_silent },

        -- custom save file
        { "n", "<C-S>", "<CMD>update!<CR>", noremap_silent },
        { "n", "<leader>q", "<CMD>:q!<CR>", noremap_silent },

        -- colorizer
        { "n", "<A-c>", "<CMD>ColorizerToggle<CR>", noremap_silent },

        -- Search for visually selected text
        {
            "v",
            "<Leader>v",
            "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>",
            remap_nosilent,
        },

        -- nvim tree.lua
        { "n", "<Leader>e", '<CMD>lua require("utils.nvimtree").toggle()<CR>', remap_nosilent },

        -- coc-restclient
        { "n", "<M-Enter>", "<CMD>CocCommand rest-client.request<CR>", noremap_silent },

        -- coc.nvim
        {
            "i",
            "<TAB>",
            [[pumvisible() ? coc#_select_confirm() : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : v:lua.check_backspace() ? "\<TAB>" : coc#refresh()]],
            noremap_silent_expr,
        },

        {
            "i",
            "<C-space>", [[coc#refresh()]],
            noremap_silent_expr,
        },
    }

    for _, key in pairs(keybindings) do
        keymap(key[1], key[2], key[3], key[4])
    end
end

-- vim.cmd('let mapleader=","')
set_keybindings()

vim.api.nvim_exec(
    [[
    augroup Format
      autocmd filetype javascript nnoremap <F4> :w <bar> exec '!node '.shellescape('%')<CR>
    augroup END
]],
    true
)
