-- Import plugin safely
local prettier_setup, prettier = pcall(require, 'prettier')
if not prettier_setup then
  print('Plugin "prettier" not found!')
  return
end

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'json',
    'markdown',
    'scss',
    'typescript',
    'typescriptreact',
    'yaml',
  },
})

