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
opt.shell = 'powershell.exe'
opt.signcolumn = 'number'


local plugins = {
    -- Packer can manage itself
    { 'wbthomason/packer.nvim' },

    'tpope/vim-surround',
    'editorconfig/editorconfig-vim',
    'karb94/neoscroll.nvim',

    -- lsp
    'neovim/nvim-lspconfig',
    'nvim-lua/lsp-status.nvim',
    {'glepnir/lspsaga.nvim'},
    {'onsails/lspkind-nvim'},
    {'simrat39/symbols-outline.nvim'},
    'L3MON4D3/LuaSnip',
    { 'hrsh7th/nvim-compe', requires = {'neovim/nvim-lspconfig'} },

    -- file explorer and icon
    { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'} },

    -- treesitter
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'winston0410/commented.nvim', requires = {'nvim-treesitter'} },
    { 'lukas-reineke/indent-blankline.nvim'},
    -- { 'lewis6991/spellsitter.nvim', requires = {'nvim-treesitter/nvim-treesitter'} },
    { 'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/lsp-status.nvim'} },
    -- works better with `scoop install fd rig ripgrep`, or install with `cargo`
    { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} },

    -- theme
    { 'dracula/vim', as = 'dracula' },

    -- minimap, require `scoop install code-minimap` or `cargo install code-minimap`
    { 'wfxr/minimap.vim' }
}

require('packer').startup(function()
    for _, plugin in ipairs(plugins) do
        use(plugin)
    end
end)

require('config.dracula')
require('config.commented')
require('config.compe')
require('config.galaxyline')
require('config.indent-blankline')
require('config.lsp')
require('config.lspkind')
require('config.lspsage')
require('config.neoscroll')
require('config.nvim-tree')
-- require('config.spellsitter')
require('config.symbol-outline')
require('config.telescope')
require('config.minimap')
