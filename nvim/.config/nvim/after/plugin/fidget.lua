-- Import plugin safely
local fidget_setup, fidget = pcall(require, 'fidget')
if not fidget_setup then
  print('Plugin "fidget" not found!')
  return
end

-- Enable fidget
fidget.setup()
