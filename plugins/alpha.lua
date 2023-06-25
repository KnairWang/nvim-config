return {
  "goolord/alpha-nvim",
  dependencies = {
    "MaximilianLloyd/ascii.nvim",
  },
  opts = function(_, opts)
    local ascii = require("ascii")
    local nv = ascii.art.text.neovim
    opts.section.header.val = nv.sharp
  end
}
