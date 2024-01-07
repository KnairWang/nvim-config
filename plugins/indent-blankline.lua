local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  config = function(_, opts)
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      vim.api.nvim_set_hl(0, "Scope", { fg = "#AEBEBE" })
    end)

    require("ibl").setup(opts)
  end,
  opts = {
    indent = {
      -- char = { " " },
      char = { "┊" },
      -- char = { "○" },
      -- char = { "⩇" },
      -- char = { "➀", "➁", "➂", "➃", "➄", "➅", "➆" },
      -- highlight = highlight,
    },
    whitespace = {
      -- highlight = highlight,
      remove_blankline_trail = true,
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      show_exact_scope = false,
      char = { "┋" },
      -- char = { "┃" },
      -- char = { "⭗" },
      -- char = { "⩆" },
      -- char = { "➊", "➋", "➌", "➍", "➎", "➏", "➐" },
      -- highlight = highlight,
      -- highlight = { "Scope" }
    },
  }
}
