-- Import plugin safely
local indent_blankline_setup, indent_blankline = pcall(require, 'indent_blankline')
if not indent_blankline_setup then
  print('Plugin "indent_blankline" not found!')
	return
end

vim.opt.list = true
vim.opt.listchars:append 'space:⋅'
-- vim.opt.listchars:append 'eol:↴'

indent_blankline.setup({
  char = '┊',
  show_trailing_blankline_indent = false,
})
