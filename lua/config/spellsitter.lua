require('spellsitter').setup({
    hl = 'SpellBad',
    captures = {'comment'}
})
vim.api.nvim_set_keymap('n', '<leader>ws', ':SymbolsOutline <CR>', { noremap = true, silent = true })
