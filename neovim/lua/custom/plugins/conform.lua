return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>m",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      yaml = { "yamlfmt" },
      go = { "goimports", "gofmt" },
      typescript = { "biome", "biome-check", stop_after_first = true },
      javascript = { "biome", "biome-check", stop_after_first = true },
      html = { "prettier" },
      sh = { "shfmt" },
      ["_"] = { "trim_whitespace" },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 250, lsp_fallback = true },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    -- Setup mason-tool-installer to automatically install formatters
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",    -- Lua formatter
        "black",     -- Python formatter
        "isort",     -- Python import sorter
        "yamlfmt",   -- YAML formatter
        "goimports", -- Go import formatter
        "biome",     -- JavaScript/TypeScript formatter
        "prettier",  -- HTML/CSS/JS formatter
        "shfmt",     -- Shell script formatter
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
