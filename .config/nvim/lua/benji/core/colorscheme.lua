-- Set colorscheme to a preferred one with protected call
-- in case it isn't installed

-- Colorscheme options: cobalt2, nightfly, rose-pine, onedark

-- To use cobalt2:
-- require('colorbuddy').colorscheme('cobalt2')

local status, _ = pcall(vim.cmd, 'colorscheme nightfly')
if not status then
  print('Colorscheme not found!')
  return
end

-- vim.g.nightflyTransparent = true
