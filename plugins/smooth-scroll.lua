if vim.g.neovide then
  return {}
else
  return {
    'declancm/cinnamon.nvim',
    event = "VeryLazy",
    config = function()
      require('cinnamon').setup({
        default_keymaps = true, -- Create default keymaps.
        override_keymaps = true, -- The plugin keymaps will override any existing keymaps.
        extra_keymaps = false,  -- Create extra keymaps.
        extended_keymaps = false, -- Create extended keymaps.

        -- OPTIONS:
        always_scroll = false,   -- Scroll the cursor even when the window hasn't scrolled.
        centered = false,         -- Keep cursor centered in window when using window scrolling.
        disabled = false,        -- Disables the plugin.
        default_delay = 0.1,       -- The default delay (in ms) between each line when scrolling.
        hide_cursor = false,     -- Hide the cursor while scrolling. Requires enabling termguicolors!
        horizontal_scroll = false, -- Enable smooth horizontal scrolling when view shifts left or right.
        max_length = 10,         -- Maximum length (in ms) of a command. The line delay will be
        -- re-calculated. Setting to -1 will disable this option.
        scroll_limit = 150,      -- Max number of lines moved before scrolling is skipped. Setting
        -- to -1 will disable this option.
      })
    end
  }
end
