call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'dracula/vim', {'as': 'dracula'}

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-surround'
" Plug 'easymotion/vim-easymotion'

" Utils
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'yamatsum/nvim-cursorline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'mhartington/formatter.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'RishabhRD/nvim-lsputils'
Plug 'kosayoda/nvim-lightbulb'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/nvim-compe'

call plug#end()

colorscheme dracula

set gfn=Hack\ NF:h14

syntax on
syntax enable

set nocompatible

set number

set tabstop=1 softtabstop=0 expandtab shiftwidth=4 smarttab

" nvim_tree
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 0
let g:nvim_tree_follow = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_tab_open = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_update_cwd = 1
let g:nvim_tree_width = 60


""""
" lua script
" LSP config

lua << END

local lsp_status = require('lsp-status')
lsp_status.register_progress()

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  lsp_status.on_attach(client, bufnr);

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer" }
for _, lang in ipairs(servers) do
  nvim_lsp[lang].setup {
    on_attach = on_attach,
    -- on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })



-- galaxyline

local colors = require('galaxyline.theme').default

local gl = require('galaxyline')


gl.section.left = {
    {
        Whitespace = { provider = function() return "   " end, highlight = {colors.fg, colors.darkblue} }
    },
    {
        FileIcon = { provider = 'FileIcon', highlight = {colors.fg, colors.darkblue} }
    },
    {
        FileName = { provider = 'FileName', highlight = {colors.fg, colors.darkblue} }
    },
    {
        GitBranch = { provider = 'GitBranch', icon = '    ', separator = '  ', highlight = {colors.blue} }
    },
    {
        LSP = { provider = function() return lsp_status.status() end, highlight = {colors.orange, colors.darkblue} }
    },
}
gl.section.right = {
    {
        LineColumn = { provider = 'LineColumn', separator = ' ', icon = '' }
    },
    {
        LineColumn_LineNumber = { provider = function() end, separator = ' ' }
    },
    {
        Encode = { provider = 'FileEncode', separator = ' ', icon = '', highlight = {colors.cyan,colors.purple} }
    },
    {
        FileType = { provider = 'FileTypeName', separator = ' ', icon = ' ', highlight = {colors.green,colors.purple} },
    },
    {
        Whitespace = { provider = function() return "   " end, highlight = {colors.fg, colors.darkblue} }
    },
}

END
