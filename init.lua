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
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.shiftround = true

require('plugins')
