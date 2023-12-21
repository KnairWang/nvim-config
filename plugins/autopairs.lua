return {
  "windwp/nvim-autopairs",
  opts = {
    ignored_next_char = "[%w%.%(%{%[]",
    fast_wrap = {
      chars = { "{", "[", "(", '"', "'", "`" },
    }
  },
  config = function(plugin, opts)
    require "plugins.configs.nvim-autopairs" (plugin, opts)

    local npairs = require "nvim-autopairs"
    local Rule = require "nvim-autopairs.rule"
    local cond = require "nvim-autopairs.conds"

    local function move_with_end_pair(opts)
      return opts.char == opts.rule.end_pair
    end

    npairs.add_rules(
      {
        Rule("<", ">", "rust")
            :with_pair(cond.not_after_regex("%w"))
            :with_pair(cond.before_text("::"))
            :with_cr(cond.none())
            :with_move(move_with_end_pair)
      }
    )
    npairs.add_rules(
      {
        Rule("<", ">", "rust")
            :with_pair(cond.not_after_regex("%w"))
            :with_pair(cond.before_regex("%w"))
            :with_cr(cond.none())
            :with_move(move_with_end_pair)
      }
    )

    npairs.add_rules(
      {
        Rule("<", ">", "rust")
            :with_pair(cond.before_text("<"))
            :with_pair(cond.after_text(">"))
            :with_pair(cond.not_after_regex("%w"))
            :with_cr(cond.none())
            :with_move(move_with_end_pair)
      }
    )
  end,
}
