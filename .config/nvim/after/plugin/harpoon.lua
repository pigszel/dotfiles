-- Import plugin safely
local harpoon_setup, harpoon = pcall(require, 'harpoon')
if not harpoon_setup then
  print('Plugin "harpoon" not found!')
  return
end

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>aa', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>h', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>j', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>k', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>l', function() ui.nav_file(4) end)
