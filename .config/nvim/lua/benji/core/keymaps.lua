-- Set leader key to space
vim.g.mapleader = ' '

-- -- Go back to netrw directory listing
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ':m ">+1<CR>gv=gv') -- Move selected text down in visual mode
vim.keymap.set('v', 'K', ':m "<-2<CR>gv=gv') -- Move selected text up in visual mode

-- Keep cursor in the middle / at the same position
vim.keymap.set('n', 'J', 'mzJ`z') -- Moving the next line to behind current line
vim.keymap.set('n', '<C-d>', '<C-d>zz') -- Page down
vim.keymap.set('n', '<C-u>', '<C-u>zz') -- Page up
vim.keymap.set('n', 'n', 'nzzzv') -- Keep search terms in the middle
vim.keymap.set('n', 'N', 'Nzzzv') -- Keep search terms in the middle

-- Keep copied buffer when overwriting/deleting
vim.keymap.set('x', '<leader>p', [['_dP]])

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [['+y]])
vim.keymap.set('n', '<leader>Y', [['+Y]])

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
