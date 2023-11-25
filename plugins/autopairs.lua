return {
  "windwp/nvim-autopairs",
  opts = {
    ignored_next_char = "[%w%.%(%{%[]",
    fast_wrap = {
      chars = { "{", "[", "(", '"', "'" },
    }
  },
  config = function(plugin, opts)
    require "plugins.configs.nvim-autopairs"(plugin, opts)

    -- local npairs = require "nvim-autopairs"
    -- local Rule = require "nvim-autopairs.rule"
    -- local cond = require "nvim-autopairs.conds"

    -- npairs.add_rules(
    --   { Rule("<", ">") }
    -- )
  end,
}