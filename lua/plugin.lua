local plugins = {
    -- Packer can manage itself
	{
		description = 'packer: plugin manager',
		enabled = true,
		uses = {'wbthomason/packer.nvim'},
		config = ''
	},
	{
		description = 'vim surround',
		enabled = true,
		uses = 'tpope/vim-surround',
		config = ''
	},
	{
		description = 'editorconfig support',
		enabled = true,
		uses = 'editorconfig/editorconfig-vim',
		config = ''
	},
	{
		description = 'smooth scroll',
		enabled = true,
		uses = 'karb94/neoscroll.nvim',
		config = 'neoscroll'
	},
	{
		description = 'explorer',
		enabled = true,
		uses = {
			'kyazdani42/nvim-tree.lua',
			requires = {'kyazdani42/nvim-web-devicons'},
		},
		config = 'nvim-tree'
	},

    -- lsp
	{
		description = 'nvim lspconfig: official lsp api wrapper',
		enabled = true,
		uses = {
			'neovim/nvim-lspconfig',
		},
		config = 'lsp'
	},
	{
		description = 'auto completion plugin',
		enabled = true,
		uses = {
			'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				'hrsh7th/cmp-vsnip',
				'hrsh7th/vim-vsnip',
			}
		},
		config = 'auto-completion'
	},
    -- 'nvim-lua/lsp-status.nvim',
    -- 'glepnir/lspsaga.nvim',
    -- 'onsails/lspkind-nvim',
    -- 'simrat39/symbols-outline.nvim',

    -- treesitter, syntax, etc
	{
		description = 'treesitter',
		enabled = true,
		uses = {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
		config = ''
	},
	{
		description = 'vim-elixir: elixir file syntax highlight',
		enabled = true,
		uses = {'elixir-editors/vim-elixir'},
		config = ''
	},
	{
		description = 'quickly comment/uncomment selection',
		enabled = true,
		uses = {'winston0410/commented.nvim', requires = {'nvim-treesitter'}},
		config = 'commented'
	},
	{
		description = 'indent blackline',
		enabled = true,
		uses = {'lukas-reineke/indent-blankline.nvim'},
		config = 'indent-blankline'
	},
    -- -- works better with `scoop install fd ripgrep`, or install with `cargo`
    -- {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}},
	{
		description = 'global search',
		enabled = true,
		uses = { "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" },
		config = 'leaderf'
	},
    
    -- theme
	{
		description = 'dracula theme',
		enabled = true,
		uses = {'dracula/vim', as = 'dracula' },
		config = 'dracula'
	}

    -- status line
    -- {'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/lsp-status.nvim'}},
    -- {'hoob3rt/lualine.nvim', requires = {'ryanoasis/vim-devicons'}},
    -- {'kdheepak/tabline.nvim', requires = {{ 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true}}}
}

-- use all enabled plugins
require('packer').startup(function()
    for _, plugin in ipairs(plugins) do
		if plugin.enabled then
			use(plugin.uses)
		end
    end
end)

-- config all enabled plugins
for _, plugin in ipairs(plugins) do
	if plugin.enabled and string.len(plugin.config) > 0 then
		require("config."..plugin.config)
	end
end

-- require('config.commented')
-- require('config.galaxyline')
-- require('config.lspkind')
-- require('config.lspsage')
-- require('config.symbol-outline')
-- require('config.telescope')
-- require('config.lualine')
-- require('config.tabline')
