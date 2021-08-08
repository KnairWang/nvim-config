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
        virtual_text = true
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = '<CR>',
        vsplit = 's',
        split = 'i',
        quit = {'q', '<Esc>'},
        scroll_down = '<C-f>',
        scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {
        quit = {'<Esc>', '<C-c>', 'q'},
        exec = '<CR>'
    },
    rename_action_keys = {
        quit = {'<Esc>', '<C-c>'},
        exec = '<CR>' -- quit can be a table
    },
    -- definition_preview_icon = '  '
    -- "single" "double" "round" "plus"
    -- border_style = "single"
    rename_prompt_prefix = '➤'
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = {metals = {'sbt', 'scala'}}
    -- server_filetype_map = {}
})

local opts = {
    noremap = true,
    silent = true
}
vim.api.nvim_set_keymap('n', '<C-`>', '<cmd>lua require("lspsaga.floaterm").open_float_terminal()<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-`>', '<cmd>lua require("lspsaga.floaterm").close_float_terminal()<CR>', opts)
