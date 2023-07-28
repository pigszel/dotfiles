-- Import plugin safely
local trouble_setup, trouble = pcall(require, 'trouble')
if not trouble_setup then
  print('Plugin "trouble" not found!')
  return
end

-- Enable trouble
trouble.setup({
  icons = false,
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})
