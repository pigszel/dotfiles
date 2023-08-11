-- Import plugin safely
local lualine_setup, lualine = pcall(require, 'lualine')
if not lualine_setup then
	print('Plugin "lualine" not found!')
	return
end

-- Get lualine nightfly theme
local lualine_nightfly = require('lualine.themes.nightfly')

-- New colors for theme
local new_colors = {
	blue = '#65D1FF',
	green = '#3EFFDC',
	violet = '#FF61EF',
	yellow = '#FFDA7B',
	black = '#000000',
}

-- Change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
	a = {
		gui = 'bold',
		bg = new_colors.yellow,
		fg = new_colors.black, -- black
	},
}

-- Configure lualine with modified theme
lualine.setup({
	options = {
		icons_enabled = true,
		theme = lualine_nightfly,
		component_separators = '|',
		-- section_separators = '',
		section_separators = { left = '', right = ''},
	},
	sections = {
		lualine_a = {
			-- { 'buffers' },
		},
	},
})
