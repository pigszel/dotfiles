local telescope_builtin = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node%_modules/.*" },
		layout_strategy = "vertical",
		layout_config = {
			preview_height = 0.6,
			-- preview_width = 0.6,
			prompt_position = "bottom",
			height = vim.o.lines, -- maximum available lines
			width = 0.9,
		},
	},
})

vim.keymap.set("n", "<leader>pf", telescope_builtin.find_files, {})
vim.keymap.set("n", "<C-p>", telescope_builtin.git_files, {})
vim.keymap.set("n", "<leader>gs", telescope_builtin.git_status, {})
vim.keymap.set("n", "<leader>gb", telescope_builtin.git_branches, {})
vim.keymap.set("n", "<leader>gc", telescope_builtin.git_commits, {})
vim.keymap.set("n", "<leader>gfc", telescope_builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>ps", function()
	telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>vh", telescope_builtin.help_tags, {})
