local telescope_builtin = require('telescope.builtin')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node%_modules/.*" }
  }
}

vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, {})
vim.keymap.set('n', '<C-p>', telescope_builtin.git_files, {})
vim.keymap.set('n', '<leader>gb', telescope_builtin.git_branches, {})
vim.keymap.set('n', '<leader>gs', telescope_builtin.git_status, {})
vim.keymap.set('n', '<leader>ps', function()
  telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>vh', telescope_builtin.help_tags, {})

