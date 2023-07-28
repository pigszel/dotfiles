-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

---------------------
-- Keymaps from ThePrimeage
--
-- Best repository ever
-- https://github.com/ThePrimeagen/init.lua
--
---------------------

-- go back to netrw directory listing
keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected up

-- keeps cursor in the middle / at the same position
keymap.set("n", "J", "mzJ`z") -- moving the next line to behind current line
keymap.set("n", "<C-d>", "<C-d>zz") -- page down
keymap.set("n", "<C-u>", "<C-u>zz") -- page up
keymap.set("n", "n", "nzzzv") -- keep search terms in the middle
keymap.set("n", "N", "Nzzzv") -- keep search terms in the middle

-- keeps copied buffer when overwriting/deleting
keymap.set("x", "<leader>p", [["_dP]])

-- yanks to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- deleting to void register
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- format document with LSP
keymap.set("n", "<leader>f", vim.lsp.buf.format)

---------------------
-- End of Keymaps from ThePrimeage
---------------------

---------------------
-- Keymaps from Josean Martinez
---------------------

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>")

-- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

---------------------
-- End of Keymaps from Josean Martinez
---------------------

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
-- keymap.set("n", "<leader>E", ":NvimTreeFocus<CR>") -- focus on file explorer

---------------------
-- Keymaps from me :)
---------------------
-- keymap.set("n", "<C-h", ":wincmd h<CR>")
-- keymap.set("n", "<C-j", ":wincmd j<CR>")
-- keymap.set("n", "<C-k", ":wincmd k<CR>")
-- keymap.set("n", "<C-l", ":wincmd l<CR>")
