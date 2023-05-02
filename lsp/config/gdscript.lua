local util = require 'lspconfig.util'

local port = os.getenv 'GDScript_Port' or '6005'
-- local cmd = { 'nc', 'localhost', port }
local cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(port))

return {
  cmd = cmd,
  filetypes = { 'gd', 'gdscript', 'gdscript3' },
  root_dir = util.root_pattern('project.godot', '.git'),
}
