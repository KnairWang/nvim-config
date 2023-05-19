if vim.opt.wrap then
  return {}
else
  local opts = {
    auto_set_mode_filetype_allowlist = {},
    auto_set_mode_filetype_denylist = {
      "neo-tree",
    },
    auto_set_mode_heuristically = false,
    create_keymappings = false,
    create_commands = false,
    notify_on_switch = false,
  }

  return {
    "andrewferrier/wrapping.nvim",
    enabled = true,
    event = "BufEnter",
    config = function()
      local wrapping = require("wrapping")
      wrapping.setup(opts)
      wrapping.soft_wrap_mode()
    end
  }
end
