-- aliases
local opt = vim.opt -- global
local g = vim.g -- global for let options
local wo = vim.wo -- window local
local bo = vim.bo -- buffer local
local fn = vim.fn -- access vim functions
local cmd = vim.cmd -- vim commands
local api = vim.api

g.Lf_usecache = 0
g.Lf_UseMemoryCache = 0
g.Lf_WildIgnore = {
    dir = {".git", "target", ".vscode", "node_modules"},
    file = {
        "*.exe", "*.dll", "*.so", "*.o", "*.d", "Cargo.lock",
        "package-lock.json"
    }
}
g.Lf_DefaultMode = "FullPath"

local w = fn.float2nr(vim.o.columns * 0.8)
if w > 140 then
    g.Lf_PopupWidth = 140
else
    g.Lf_PopupWidth = w
end

g.Lf_PopupPosition = {0, fn.float2nr((vim.o.columns - g.Lf_PopupWidth) / 2)}

g.Lf_UseVersionControlTool = 0
g.Lf_DefaultExternalTool = "rg"
g.Lf_ShowHidden = 1

g.Lf_ShortcutF = ""
g.Lf_ShortcutB = ""
g.Lf_CommandMap = {["<C-J>"] = {"<C-N>"}, ["<C-K>"] = {"<C-P>"}}

g.Lf_WorkingDirectoryMode = 'a'

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Search files in popup window
-- nnoremap <silent> <leader>ff :<C-U>Leaderf file --popup<CR>
map('n', '<leader>ff', ':<C-U>Leaderf file --popup<CR>')

-- Grep project files in popup window
-- nnoremap <silent> <leader>fg :<C-U>Leaderf rg --no-messages --popup<CR>
map('n', '<leader>fg', ':<C-U>Leaderf rg --no-messages --popup<CR>')

-- Search vim help files
-- nnoremap <silent> <leader>fh :<C-U>Leaderf help --popup<CR>
map('n', '<leader>fh', ':<C-U>Leaderf help --popup<CR>')

-- Search tags in current buffer
-- nnoremap <silent> <leader>ft :<C-U>Leaderf bufTag --popup<CR>
map('n', '<leader>ft', ':<C-U>Leaderf bufTag --popup<CR>')

-- Switch buffers
-- nnoremap <silent> <leader>fb :<C-U>Leaderf buffer --popup<CR>
map('n', '<leader>fb', ':<C-U>Leaderf buffer --popup<CR>')

-- Search recent files
-- nnoremap <silent> <leader>fr :<C-U>Leaderf mru --popup<CR>
map('n', '<leader>fr', ':<C-U>Leaderf mru --popup<CR>')
