-- Import plugin safely
local bufferline_setup, bufferline = pcall(require, 'bufferline')
if not bufferline_setup then
  print('Plugin "bufferline" not found!')
  return
end

bufferline.setup({
  options = {
    mode = 'buffers', -- 'buffers', 'tabs'
    separator_style = 'slant', -- 'slant', 'slope', 'thick', 'thin'
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icons = false,
    color_icons = true,
  },
  highlights = {
    separator = {
      guifg = '#073642',
      guibg = '#002b36',
    },
    separator_selected = {
      guifg = '#073642',
    },
    background = {
      guifg = '#657b83',
      guibg = '#002b36',
    },
    buffer_selected = {
      guifg = '#fdf6e3',
      gui = 'bold',
    },
    fill = {
      guibg = '#073642',
    },
  },
})

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})

