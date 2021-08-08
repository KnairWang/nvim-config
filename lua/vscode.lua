local plugins = {
	{ 'wbthomason/packer.nvim', run = ':PackerCompile' },
	'tpope/vim-surround',
	'editorconfig/editorconfig-vim',
	'karb94/neoscroll.nvim',
	-- lsp
	'neovim/nvim-lspconfig',
	-- treesitter
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'hrsh7th/nvim-compe', requires = {'neovim/nvim-lspconfig'} }
}

require('packer').startup(function()
	for _, plugin in ipairs(plugins) do
		use(plugin)
	end
end)

require('vscode_config.compe')
require('vscode_config.lsp')
