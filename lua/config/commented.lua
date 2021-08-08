require('nvim-treesitter.configs').setup({
    context_commentstring = {
        enable = true,
        -- This plugin provided an autocommand option
        enable_autocmd = true
    }
})
require('commented').setup({
    comment_padding = " ", -- padding between starting and ending comment symbols
    keybindings = {
        n = "<C-/>",
        v = "<C-/>",
        nl = "<C-/>"
    }, -- what key to toggle comment, nl is for mapping <leader>c$, just like dd for d
    prefer_block_comment = false, -- Set it to true to automatically use block comment when multiple lines are selected
    set_keybindings = true, -- whether or not keybinding is set on setup
    ex_mode_cmd = "Comment" -- command for commenting in ex-mode, set it null to not set the command initially.
})
