vim.g.mapleader = '\\'

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>Y', '"+Y')
map('v', '<leader>Y', '"+Y')
map('n', '<leader>p', '"+p')
map('v', '<leader>p', '"+p')
map('n', '<leader>P', '"+P')
map('v', '<leader>P', '"+P')
