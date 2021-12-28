local plugins = {
    -- Packer can manage itself
	{
		description = 'packer: plugin manager',
		enabled = true,
		config = {'wbthomason/packer.nvim'},
		requires = ''
	},
	{
		description = 'vim surround',
		enabled = true,
		config = 'tpope/vim-surround',
		requires = ''
	},
	{
		description = 'editorconfig support',
		enabled = true,
		config = 'editorconfig/editorconfig-vim',
		requires = ''
	},
	{
		description = 'smooth scroll',
		enabled = true,
		config = 'karb94/neoscroll.nvim',
		requires = 'neoscroll'
	},
    -- {'preservim/nerdtree', requires = {'ryanoasis/vim-devicons'}},

    -- lsp
	{
		description = 'nvim lspconfig: official lsp api wrapper',
		enabled = true,
		config = 'neovim/nvim-lspconfig',
		requires = 'lsp'
	},
	{
		description = 'auto completion plugin',
		enabled = true,
		config = {
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
		requires = 'auto-completion'
	},
    -- {'hrsh7th/vim-vsnip', requires = {'hrsh7th/vim-vsnip-integ'}},
    -- 'nvim-lua/lsp-status.nvim',
    -- 'glepnir/lspsaga.nvim',
    -- 'onsails/lspkind-nvim',
    -- 'simrat39/symbols-outline.nvim',

    -- treesitter
	{
		description = 'treesitter',
		enabled = true,
		config = {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
		requires = ''
	},
    -- {'winston0410/commented.nvim', requires = {'nvim-treesitter'}},
    -- {'lukas-reineke/indent-blankline.nvim'},
    -- -- works better with `scoop install fd rig ripgrep`, or install with `cargo`
    -- {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}},
    
    -- theme
	{
		description = 'dracula theme',
		enabled = true,
		config = {'dracula/vim', as = 'dracula' },
		requires = 'dracula'
	}

    -- status line
    -- {'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/lsp-status.nvim'}},
    -- {'hoob3rt/lualine.nvim', requires = {'ryanoasis/vim-devicons'}},
    -- {'kdheepak/tabline.nvim', requires = {{ 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true}}}
}

-- startup all enabled plugins
require('packer').startup(function()
    for _, plugin in ipairs(plugins) do
		if plugin.enabled then
			use(plugin.config)
		end
    end
end)

-- config all enabled plugins
for _, plugin in ipairs(plugins) do
	if plugin.enabled and string.len(plugin.requires) > 0 then
		require("config."..plugin.requires)
	end
end

-- require('config.commented')
-- require('config.compe')
-- require('config.galaxyline')
-- require('config.indent-blankline')
-- require('config.lspkind')
-- require('config.lspsage')
-- require('config.symbol-outline')
-- require('config.telescope')
-- require('config.nerdtree')
-- require('config.lualine')
-- require('config.tabline')
