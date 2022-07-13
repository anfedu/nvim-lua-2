-- vim.g.nvim_tree_side = "left"
-- -- vim.g.nvim_tree_width = 35
-- vim.g.nvim_tree_gitignore = 1
-- vim.g.nvim_tree_auto_open = 0
-- vim.g.nvim_tree_auto_close = 0
-- vim.g.nvim_tree_auto_ignore_ft = {}
-- vim.g.nvim_tree_quit_on_open = 0
-- -- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_hide_dotfiles = 1
-- vim.g.nvim_tree_highlight_opened_files = 1
-- vim.g.nvim_tree_root_folder_modifier = ":~"
-- vim.g.nvim_tree_tab_open = 1
-- vim.g.nvim_tree_group_empty = 0
-- vim.g.nvim_tree_disable_window_picker = 1
-- vim.g.nvim_tree_lsp_diagnostics=0
-- vim.g.nvim_tree_hijack_cursor = 0
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1 }
-- vim.g.nvim_tree_ignore = { "node_modules", ".cache" }

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = { unstaged = "✗", staged = "✓", unmerged = "", renamed = "➜", untracked = "★" },
    folder = { default = " ", open = " " },
}

-- -- disable word wrap
-- vim.cmd("autocmd FileType LuaTree setlocal nowrap")


require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
