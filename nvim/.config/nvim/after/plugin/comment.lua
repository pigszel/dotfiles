-- Import plugin safely
local comment_setup, comment = pcall(require, 'Comment')
if not comment_setup then
  print('Plugin "Comment" not found!')
  return
end

-- Enable comment
comment.setup()
