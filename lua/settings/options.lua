local function setOptions(options)
  for key, val in pairs(options) do
    if val == true then
      vim.api.nvim_command('set ' .. key)
    elseif val == false then
      vim.api.nvim_command('set no' .. key)
    else
      vim.api.nvim_command('set ' .. key .. '=' .. val)
    end
  end
end

local options = {
  -- autoindent = true,
  -- autoread = true,
  -- backspace = 'indent,eol,start',
  -- backup = true,
  -- backupdir = '~/.local/share/nvim/backup',
  cursorline = true,
  -- cursorcolumn = true,
  -- ttimeoutlen = 50,
  -- updatetime = 300,
  -- termguicolors = true,
  -- title = false,
  -- startofline = false,
  -- relativenumber = true,
  bg = 'dark',
  binary = true,
  bomb = true,
  nuw = 5,
  shell = '/usr/bin/zsh',
  clipboard = 'unnamedplus',
  compatible = false,
  completeopt = 'menuone,noselect',
  conceallevel = 0,
  swapfile = false,
  encoding = 'utf-8',
  errorbells = false,
  expandtab = true,
  fileencoding = 'utf-8',
  fileencodings = 'utf-8',
  fileformat = 'unix',
  fillchars = 'vert:┃',
  foldlevel = 0,
  foldmethod = 'manual',
  foldexpr = 'nvim_treesitter#foldexpr()',
  formatoptions = 'jcroql',
  gdefault = true,
  hidden = true,
  hlsearch = true,
  ignorecase = true,
  inccommand = 'nosplit',
  incsearch = true,
  laststatus = 2,
  lazyredraw = true,
  linebreak = true,
  linespace = 0,
  list = true,
  listchars = 'tab:»»,trail:-,nbsp:-',
  mouse = 'a',
  guitablabel = '',
  number = true,
  pumblend = 10,
  pumheight = 15,
  pyxversion = 3,
  report = 2,
  ruler = true,
  scrolloff = 5,
  shortmess = 'atToOc',
  showcmd = false,
  showmatch = false,
  showmode = false,
  showtabline = 2,
  sidescrolloff = 10,
  smartcase = true,
  cmdheight = 2,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  splitbelow = true,
  splitright = true,
  re = 0,
  t_Co = '256',
  writebackup = true,
  visualbell = false,
  wildmenu = true,
  wildmode = 'full',
  wildoptions = 'pum',
  winblend = 0,
  wrap = false, 
  guicursor = 'a:blinkon1,n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'
}

setOptions(options)

-- vim.api.nvim_exec(
--     [[
--         augroup JsonToJsonc
--             autocmd! FileType json set filetype=jsonc
--         augroup END
-- ]],
--     true
-- )
