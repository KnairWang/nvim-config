return {
  'declancm/cinnamon.nvim',
  event = "VeryLazy",
  config = function()
    require('cinnamon').setup({
      override_keymaps = true,
      max_length = 100,
    })
  end
}