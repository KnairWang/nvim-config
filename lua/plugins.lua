require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-surround'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use {
        'RishabhRD/nvim-lsputils',
        requires = {'RishabhRD/popfix'},
        config = function()
            vim.cmd('set completeopt=menuone,noselect')
        end
    }

    use 'kosayoda/nvim-lightbulb'
    use 'ray-x/lsp_signature.nvim'
    use {
        'hrsh7th/nvim-compe',
        requires = {'neovim/nvim-lspconfig'},
        config = function()
            -- Compe setup
            require'compe'.setup {
                enabled = true,
                autocomplete = true,
                debug = false,
                min_length = 1,
                preselect = 'enable',
                throttle_time = 80,
                source_timeout = 200,
                incomplete_delay = 400,
                max_abbr_width = 100,
                max_kind_width = 100,
                max_menu_width = 100,
                documentation = true,

                source = {path = true, nvim_lsp = true}
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
            -- _G.tab_complete = function()
                -- if vim.fn.pumvisible() == 1 then
                    -- return t "<C-n>"
                -- elseif check_back_space() then
                    -- return t "<Tab>"
                -- else
                    -- return vim.fn['compe#complete']()
                -- end
            -- end
            -- _G.s_tab_complete = function()
                -- if vim.fn.pumvisible() == 1 then
                    -- return t "<C-p>"
                -- else
                    -- return t "<S-Tab>"
                -- end
            -- end

            -- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
            -- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
            -- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
            -- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

            vim.api.nvim_set_keymap('i', '<Tab>', 'compe#confirm("<Tab>")', {expr = true})
            -- This line is important for auto-import
            vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', {expr = true})
            vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', {expr = true})
        end
    }


    -- file explorer and icon
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            vim.g.nvim_tree_auto_open = 1
            vim.g.nvim_tree_auto_close = 0
            vim.g.nvim_tree_follow = 1
            vim.g.nvim_tree_highlight_opened_files = 1
            vim.g.nvim_tree_tab_open = 1
            vim.g.nvim_tree_add_trailing = 1
            vim.g.nvim_tree_lsp_diagnostics = 1
            vim.g.nvim_tree_update_cwd = 1
            vim.g.nvim_tree_width = 40
        end
    }

    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {
        'lewis6991/spellsitter.nvim',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require('spellsitter').setup({
                hl = 'SpellBad',
                captures = {'comment'},
            })
        end
    }
    use {
        'winston0410/commented.nvim',
        requires = {'nvim-treesitter'},
        config = function()
            require('nvim-treesitter.configs').setup({
                context_commentstring = {
                    enable = true,
                    -- This plugin provided an autocommand option
                    enable_autocmd = true,
                }
            })
            require('commented').setup({
                comment_padding = " ", -- padding between starting and ending comment symbols
                keybindings = {n = "<C-/>", v = "<C-/>", nl = "<C-/>"}, -- what key to toggle comment, nl is for mapping <leader>c$, just like dd for d
                prefer_block_comment = false, -- Set it to true to automatically use block comment when multiple lines are selected
                set_keybindings = true, -- whether or not keybinding is set on setup
                ex_mode_cmd = "Comment" -- command for commenting in ex-mode, set it null to not set the command initially.
            })
        end
    }

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/lsp-status.nvim'},
        config = function()
            local lsp_status = require('lsp-status')
            local colors = require('galaxyline.theme').default
            local gl = require('galaxyline')

            gl.section.left = {
                {
                    Whitespace = {
                        provider = function() return "   " end,
                        highlight = {colors.fg, colors.darkblue}
                    }
                },
                {
                    FileIcon = {
                        provider = 'FileIcon',
                        highlight = {colors.fg, colors.darkblue}
                    }
                },
                {
                    FileName = {
                        provider = 'FileName',
                        highlight = {colors.fg, colors.darkblue}
                    }
                }, {
                    GitBranch = {
                        provider = 'GitBranch',
                        icon = '    ',
                        separator = '  ',
                        highlight = {colors.blue}
                    }
                }, {
                    LSP = {
                        provider = function() return lsp_status.status() end,
                        highlight = {colors.orange, colors.darkblue}
                    }
                }
            }
            gl.section.right = {
                {
                    LineColumn = {
                        provider = 'LineColumn',
                        separator = ' ',
                        icon = ''
                    }
                },
                {
                    LineColumn_LineNumber = {
                        provider = function() end,
                        separator = ' '
                    }
                }, {
                    Encode = {
                        provider = 'FileEncode',
                        separator = ' ',
                        icon = '',
                        highlight = {colors.cyan, colors.purple}
                    }
                }, {
                    FileType = {
                        provider = 'FileTypeName',
                        separator = ' ',
                        icon = ' ',
                        highlight = {colors.green, colors.purple}
                    }
                }, {
                    WhitespaceR = {
                        provider = function() return "   " end,
                        separator = ' ',
                        highlight = {colors.fg, colors.darkblue}
                    }
                }
            }
        end
    }

    -- theme
    use {
        'dracula/vim',
        as = 'dracula',
        config = function() vim.cmd('colorscheme dracula') end
    }

    -- cursorline
    use {'yamatsum/nvim-cursorline', requires = {'dracula'}}

    use {
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("toggleterm").setup{
                -- size can be a number or function which is passed the current terminal
                size = 20,
                -- | function(term)
                    -- if term.direction == "horizontal" then
                        -- return 15
                    -- elseif term.direction == "vertical" then
                        -- return vim.o.columns * 0.4
                    -- end
                -- end,
                open_mapping = [[<c-\>]],
                hide_numbers = true, -- hide the number column in toggleterm buffers
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                persist_size = true,
                direction = 'float', -- 'vertical' | 'horizontal' | 'window' | 'float',
                close_on_exit = true, -- close the terminal window when the process exits
                shell = 'sh.exe', -- change the default shell
                -- This field is only relevant if direction is set to 'float'
                -- float_opts = {
                    -- -- The border key is *almost* the same as 'nvim_win_open'
                    -- -- see :h nvim_win_open for details on borders however
                    -- -- the 'curved' border is a custom border type
                    -- -- not natively supported but implemented in this plugin.
                    -- border = 'single', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                    -- width = 1,
                    -- height = 1,
                    -- winblend = 3,
                    -- highlights = {
                        -- border = "Normal",
                        -- background = "Normal",
                    -- }
                -- }
            }
        end
    }

    use {
        'camspiers/snap',
        config = function()
            local snap = require('snap')
            snap.maps {
                {"<Leader><Leader>", snap.config.file {producer = "ripgrep.file"}},
                {"<Leader>fb", snap.config.file {producer = "vim.buffer"}},
                {"<Leader>fo", snap.config.file {producer = "vim.oldfile"}},
                {"<Leader>ff", snap.config.vimgrep {}},
            }
        end
    }
end)

local function setup_nvim_lsputils()
    vim.lsp.handlers['textDocument/codeAction'] =
    require('lsputil.codeAction').code_action_handler
    vim.lsp.handlers['textDocument/references'] =
    require('lsputil.locations').references_handler
    vim.lsp.handlers['textDocument/definition'] =
    require('lsputil.locations').definition_handler
    vim.lsp.handlers['textDocument/declaration'] =
    require('lsputil.locations').declaration_handler
    vim.lsp.handlers['textDocument/typeDefinition'] =
    require('lsputil.locations').typeDefinition_handler
    vim.lsp.handlers['textDocument/implementation'] =
    require('lsputil.locations').implementation_handler
    vim.lsp.handlers['textDocument/documentSymbol'] =
    require('lsputil.symbols').document_handler
    vim.lsp.handlers['workspace/symbol'] =
    require('lsputil.symbols').workspace_handler
end

local function setup_lsp()
    -- lsp status
    local lsp_status = require('lsp-status')
    lsp_status.register_progress()

    local nvim_lsp = require('lspconfig')

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)

        lsp_status.on_attach(client, bufnr);

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = {noremap = true, silent = true}

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
        opts)
        buf_set_keymap('n', '<C-k>',
        '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa',
        '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr',
        '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
        opts)
        buf_set_keymap('n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
        opts)
        buf_set_keymap('n', '<space>D',
        '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
        opts)
        buf_set_keymap('n', '<space>ca',
        '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e',
        '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
        opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
        opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
        opts)
        buf_set_keymap('n', '<space>q',
        '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",
        opts)

        setup_nvim_lsputils()
    end

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local servers = {"rust_analyzer"}
    for _, lang in ipairs(servers) do
        nvim_lsp[lang].setup {
            on_attach = on_attach,
            -- on_attach = lsp_status.on_attach,
            capabilities = lsp_status.capabilities,
            flags = {debounce_text_changes = 150}
        }
    end
end

setup_lsp()
