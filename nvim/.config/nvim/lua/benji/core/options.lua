-- vim.opt.guicursor = ''

-- Enable mouse mode
vim.opt.mouse = 'a'

-- line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
vim.opt.wrap = true

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true -- Save undo history

vim.opt.hlsearch = false -- disable search highlighting
vim.opt.incsearch = true -- use incremental search


-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
vim.opt.termguicolors = true

vim.opt.scrolloff = 8 -- never has less than 8 on top/bottom of screen when 'scrolling'
vim.opt.background = 'dark' -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = 'yes' -- show sign column so that text doesn't shift
vim.opt.isfname:append('@-@')

-- backspace
vim.opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- 'endofline', 'eol', 'noendofline', 'noeol'
vim.opt.endofline = true

-- clipboard
vim.opt.clipboard:append('unnamedplus') -- use system clipboard as default register

-- Enable break indent
vim.opt.breakindent = true

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- Fast update time
vim.opt.updatetime = 50
vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.opt.colorcolumn = '120' -- show column after 80 chars

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- vim.opt.iskeyword:append('-') -- consider string-string as whole word

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
