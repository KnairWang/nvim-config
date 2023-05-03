local util = require 'lspconfig.util'

local port = os.getenv 'GDScript_Port' or '6005'
local address = '127.0.0.1'
-- local cmd = { 'nc', 'localhost', port }
local cmd = nil

if ("Windows_NT" == vim.loop.os_uname().sysname) then
  cmd = { 'ncat', address, port }
else
  cmd = vim.lsp.rpc.connect(address, tonumber(port))
end

return {
  cmd = cmd,
  filetypes = { 'gd', 'gdscript', 'gdscript3' },
  root_dir = util.root_pattern('project.godot', '.git'),
}
