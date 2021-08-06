local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options


vim.g.mapleader = '\\'

vim.cmd 'set gfn=Hack\\ NF:h14'

vim.cmd 'syntax on'
vim.cmd 'syntax enable'

vim.cmd 'set nocompatible'

vim.cmd 'set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab'

opt.number = true
opt.relativenumber = false
opt.scrolloff = 10
opt.sidescrolloff = 20
opt.shiftround = true

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')

require('plugins')
