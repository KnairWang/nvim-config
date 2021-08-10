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
    local opts = {
        noremap = true,
        silent = true
    }

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
    flags = {
        debounce_text_changes = 150
    },
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self"
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            }
        }
    }
})

lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150
    },
})
