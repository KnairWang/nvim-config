local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

require('common')
if g.vscode ~= nil then
  require('vscode')
else
  require('native')
end
