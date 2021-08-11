-- vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeWinSize = 50
vim.g.NERDTreeHijackNetrw = 0
-- block netrw
vim.g.loaded_netrw = 0

-- vim.g.NERDTreeRemoveDirCmd = ""

vim.cmd [[augroup NERDTreeOpen]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd StdinReadPre * let s:std_in=1]]
vim.cmd [[  autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif ]]
vim.cmd [[augroup END]]
