return function()
  -- require("neo-tree").setup({
  --     filesystem = { filtered_items = { visible = true } }
  -- })
  local function hurl_ft(path, bufnr)
    -- fallback
    -- return yaml if nothing else
    return "hurl"
  end
  vim.filetype.add {
    extension = {
      hurl = hurl_ft,
    },
  }
end
