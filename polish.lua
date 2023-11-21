return function()
  local uname = vim.loop.os_uname()
  -- Linux
  -- Windows
  local sysname = uname['sysname']

  -- 
  -- Windows 11 Enterprise
  local version = uname['version']

  -- 6.1.21.2-microsoft-standard-WSL2
  -- 10.0.22621
  local release = uname['release']

  -- x86_64
  local machine = uname['machine']

  if sysname == 'Linux' or sysname == 'linux' then
    if string.find(release, 'microsoft') or string.find(release, 'Microsoft') then
      -- setup for wsl
      
    --   if vim.g.clipboard == nil then
    --     vim.g.clipboard = {}
    --   end
    --   local clipboard = vim.g.clipboard
    --   clipboard['name'] = 'WslClipboard'

    --   clipboard['copy'] = {}
    --   local copy_cmd = 'clip.exe'
    --   clipboard['copy']['+'] = copy_cmd
    --   clipboard['copy']['*'] = copy_cmd

    --   clipboard['paste'] = {}
    --   local paste_cmd = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", "")'
    --   clipboard['paste']['+'] = paste_cmd
    --   clipboard['paste']['*'] = paste_cmd

    --   clipboard['cache_enabled'] = 0
    end
  end

  -- require("neo-tree").setup({
  --     filesystem = { filtered_items = { visible = true } }
  -- })
  -- local function hurl_ft(path, bufnr)
  --   -- fallback
  --   -- return yaml if nothing else
  --   return "hurl"
  -- end
  -- vim.filetype.add {
  --   extension = {
  --     hurl = hurl_ft,
  --   },
  -- }
end
