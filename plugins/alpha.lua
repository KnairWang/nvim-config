return {
  "goolord/alpha-nvim",
  dependencies = {
    "MaximilianLloyd/ascii.nvim",
  },
  opts = function(_, opts)
    local ascii = require("ascii")
    opts.section.header.val = ascii.get_random("text", "neovim")
  end
}
