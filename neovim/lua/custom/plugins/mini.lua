return {
  "echasnovski/mini.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  version = '*',
  config = function()
    require("mini.surround").setup({})
    require("mini.pairs").setup({}) --alternative for nvim-autopairs
    require("mini.move").setup({})
    require("mini.bracketed").setup({})
    require("mini.ai").setup({})
    require("mini.comment").setup({})
    require("mini.animate").setup({})
    require("mini.trailspace").setup({})
    require("mini.statusline").setup({})
  end,
}
