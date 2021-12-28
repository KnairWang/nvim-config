-- aliases
local opt  = vim.opt     -- global
local g  = vim.g     -- global for let options
local wo = vim.wo    -- window local
local bo = vim.bo    -- buffer local
local fn = vim.fn    -- access vim functions
local cmd = vim.cmd  -- vim commands

opt.swapfile = true
opt.dir = '/tmp/nvim'

opt.laststatus = 2

opt.completeopt = "menuone,noselect"
opt.inccommand = 'nosplit'
opt.syntax = 'enable'

opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true
opt.showmatch = true

opt.wildmenu = true
opt.ruler = true
opt.gfn = 'Hack\\ NF:h14'

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.number = true
opt.relativenumber = false
opt.scrolloff = 10
opt.sidescrolloff = 20
opt.shiftround = true
opt.signcolumn = 'number'
opt.mouse = 'a'


require('plugin')
