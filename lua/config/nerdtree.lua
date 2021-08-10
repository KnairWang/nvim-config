-- vim.api.nvim_set_keymap('n', '<leader>ws', ':SymbolsOutline <CR>', { noremap = true, silent = true })

-- vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeWinSize = 50

vim.cmd [[augroup NERDTreeOpen]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd StdinReadPre * let s:std_in=1]]
vim.cmd [[  autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif ]]
-- vim.cmd [[  autocmd VimEnter * NERDTree]]
vim.cmd [[augroup END]]
