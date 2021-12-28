local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

cmd 'set gfn=Hack\\ NF:h14'
cmd 'syntax on'
cmd 'syntax enable'
cmd 'set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab'
opt.number = true
opt.relativenumber = false
opt.scrolloff = 10
opt.sidescrolloff = 20
opt.shiftround = true
-- opt.shell = 'sh.exe'
opt.signcolumn = 'number'
opt.mouse = 'a'

require('plugin')
