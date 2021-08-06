require('packer').startup(function()
    -- Packer can manage itself
    use {'wbthomason/packer.nvim', run = ':PackerCompile'}

    use 'tpope/vim-surround'
    use 'editorconfig/editorconfig-vim'
    use {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                            '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,        -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,              -- Function to run after the scrolling animation ends
            })
        end
    }

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use {
        'glepnir/lspsaga.nvim',
        config = function()
            require('lspsaga').init_lsp_saga({
                use_saga_diagnostic_sign = true,
                error_sign = ' ',
                warn_sign = ' ',
                hint_sign = ' ',
                infor_sign = ' ',
                dianostic_header_icon = '   ',
                code_action_icon = ' ',
                code_action_prompt = {
                    enable = false,
                    sign = true,
                    sign_priority = 40,
                    virtual_text = true,
                },
                finder_definition_icon = '  ',
                finder_reference_icon = '  ',
                max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
                finder_action_keys = {
                    open = '<CR>', vsplit = 's',split = 'i',quit = {'q', '<Esc>'},scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
                },
                code_action_keys = {
                    quit = {'<Esc>', '<C-c>','q'}, exec = '<CR>'
                },
                rename_action_keys = {
                    quit = {'<Esc>', '<C-c>'}, exec = '<CR>'  -- quit can be a table
                },
                -- definition_preview_icon = '  '
                -- "single" "double" "round" "plus"
                -- border_style = "single"
                rename_prompt_prefix = '➤',
                -- if you don't use nvim-lspconfig you must pass your server name and
                -- the related filetypes into this table
                -- like server_filetype_map = {metals = {'sbt', 'scala'}}
                -- server_filetype_map = {}
            })

            local opts = {noremap = true, silent = true}
            vim.api.nvim_set_keymap('n', '<C-`>', '<cmd>lua require("lspsaga.floaterm").open_float_terminal()<CR>', opts)
            vim.api.nvim_set_keymap('t', '<C-`>', '<cmd>lua require("lspsaga.floaterm").close_float_terminal()<CR>', opts)
        end
    }
    use {
        'onsails/lspkind-nvim',
        config = function ()
            require('lspkind').init({
                -- enables text annotations
                --
                -- default: true
                with_text = true,

                -- default symbol map
                -- can be either 'default' or
                -- 'codicons' for codicon preset (requires vscode-codicons font installed)
                --
                -- default: 'default'
                preset = 'default',

                -- override preset symbols
                --
                -- default: {}
                symbol_map = {
                    Text = " ",
                    Method = " ",
                    Function = " ",
                    Constructor = " ",
                    Field = "﯑ ",
                    Variable = " ",
                    Class = "ﴯ ",
                    Interface = " ",
                    Module = " ",
                    Property = "ﰠ ",
                    Unit = "塞 ",
                    Value = " ",
                    Enum = " ",
                    Keyword = " ",
                    Snippet = " ",
                    Color = " ",
                    File = " ",
                    Reference = " ",
                    Folder = " ",
                    EnumMember = " ",
                    Constant = " ",
                    Struct = "פּ ",
                    Event = " ",
                    Operator = " ",
                    TypeParameter = "𝙏 "
                },
            })
        end
    }
    use {
        'simrat39/symbols-outline.nvim',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>s', ':SymbolsOutlineOpen <CR>', {noremap = true, silent = true})
            vim.g.symbols_outline = {
                highlight_hovered_item = true,
                show_guides = true,
                auto_preview = true,
                position = 'right',
                width = 25,
                show_numbers = false,
                show_relative_numbers = false,
                show_symbol_details = true,
                keymaps = { -- These keymaps can be a string or a table for multiple keys
                    close = {"<Esc>", "q"},
                    goto_location = "<Cr>",
                    focus_location = "o",
                    hover_symbol = "<C-space>",
                    rename_symbol = "r",
                    code_actions = "a",
                },
                lsp_blacklist = {},
                symbol_blacklist = {},
                symbols = {
                    File = {icon = " ", hl = "TSURI"},
                    Module = {icon = " ", hl = "TSNamespace"},
                    Namespace = {icon = " ", hl = "TSNamespace"},
                    Package = {icon = " ", hl = "TSNamespace"},
                    Class = {icon = "ﴯ ", hl = "TSType"},
                    Method = {icon = " ", hl = "TSMethod"},
                    Property = {icon = "ﰠ ", hl = "TSMethod"},
                    Field = {icon = "﯑ ", hl = "TSField"},
                    Constructor = {icon = " ", hl = "TSConstructor"},
                    Enum = {icon = " ", hl = "TSType"},
                    Interface = {icon = " ", hl = "TSType"},
                    Function = {icon = " ", hl = "TSFunction"},
                    Variable = {icon = " ", hl = "TSConstant"},
                    Constant = {icon = " ", hl = "TSConstant"},
                    String = {icon = " ", hl = "TSString"},
                    Number = {icon = " ", hl = "TSNumber"},
                    Boolean = {icon = "⊨ ", hl = "TSBoolean"},
                    Array = {icon = " ", hl = "TSConstant"},
                    Object = {icon = " ", hl = "TSType"},
                    Key = {icon = " ", hl = "TSType"},
                    Null = {icon = "ﳠ ", hl = "TSType"},
                    EnumMember = {icon = " ", hl = "TSField"},
                    Struct = {icon = "פּ ", hl = "TSType"},
                    Event = {icon = "🗲 ", hl = "TSType"},
                    Operator = {icon = " ", hl = "TSOperator"},
                    TypeParameter = {icon = "𝙏 ", hl = "TSParameter"}
                }
            }
        end
    }
    use 'L3MON4D3/LuaSnip'
    use {
        'hrsh7th/nvim-compe',
        requires = {'neovim/nvim-lspconfig'},
        config = function()
            -- Compe setup
            require'compe'.setup {
                enabled = true;
                autocomplete = true;
                debug = false;
                min_length = 1;
                preselect = 'disable';
                throttle_time = 80;
                source_timeout = 200;
                resolve_timeout = 800;
                incomplete_delay = 400;
                max_abbr_width = 100;
                max_kind_width = 100;
                max_menu_width = 100;
                documentation = {
                    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
                    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
                    max_width = 120,
                    min_width = 60,
                    max_height = math.floor(vim.o.lines * 0.3),
                    min_height = 1,
                };
                source = {
                    path = true;
                    buffer = true;
                    calc = true;
                    nvim_lsp = true;
                    nvim_lua = false;
                    vsnip = false;
                    ultisnips = false;
                    luasnip = true;
                };
            }

            vim.api.nvim_set_keymap('i', '<Tab>', 'compe#confirm({ "keys": "<Tab>", "select": v:true })', {expr = true})
            vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm({ "keys": "<cr>", "select": v:true })', {expr = true})
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
            vim.g.nvim_tree_follow = 0
            vim.g.nvim_tree_highlight_opened_files = 0
            vim.g.nvim_tree_tab_open = 1
            vim.g.nvim_tree_add_trailing = 1
            vim.g.nvim_tree_lsp_diagnostics = 1
            vim.g.nvim_tree_update_cwd = 1
            vim.g.nvim_tree_width = 50
            vim.g.nvim_tree_window_picker_exclude = { filetype = { 'packer', 'qf', 'outline' }, buftype = { 'terminal' } }
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
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                char = "|",
                buftype_exclude = {"terminal"}
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
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            require('telescope').setup({
                defaults = {
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case'
                    },
                    prompt_prefix = "> ",
                    selection_caret = "> ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "descending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            mirror = false,
                        },
                        vertical = {
                            mirror = false,
                        },
                    },
                    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
                    file_ignore_patterns = {},
                    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
                    winblend = 0,
                    border = {},
                    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                    color_devicons = true,
                    use_less = true,
                    path_display = {},
                    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
                    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
                    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
                    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

                    -- Developer configurations: Not meant for general override
                    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
                }
            })
        end
    }
end)

local function setup_lsp()
    -- lsp status
    local lsp_status = require('lsp-status')
    lsp_status.register_progress()

    local lsp = require('lspconfig')

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

        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', 'gc', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
        buf_set_keymap('n', 'gC', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

        -- buf_set_keymap('n', 'gf', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
        buf_set_keymap('n', '<space>h', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
        buf_set_keymap('n', '<space>j', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', opts)
        buf_set_keymap('n', '<space>k', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
        -- buf_set_keymap('n', 'gi', '<cmd>lua require("lspsaga.implement").lspsaga_implementation()<CR>', opts)

        -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

        buf_set_keymap('n', '<space>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
        buf_set_keymap('v', '<space>ca', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)
        buf_set_keymap('n', '<A-cr>', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
        buf_set_keymap('v', '<A-cr>', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)

        buf_set_keymap('n', '<space>r', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
        
        buf_set_keymap('n', '<space>e', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '<space>d', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)

        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    vim.cmd('set completeopt=menuone,noselect')
    local capabilities = lsp_status.capabilities
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- rust_analyzer
    lsp.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 150},
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self",
                },
                cargo = {
                    loadOutDirsFromCheck = true
                },
                procMacro = {
                    enable = true
                },
            }
        }
    })
end

setup_lsp()
