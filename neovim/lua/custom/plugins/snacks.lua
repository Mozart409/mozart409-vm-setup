return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		---@class snacks.explorer.Config
		explorer = {
			enabled = true,
		},
		indent = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		zen = { enabled = true },
	},
	keys = {
		{
			"<leader>fe",
			function()
				Snacks.explorer.open({ hidden = true, ignored = true, exclude = { ".git", "node_modules" } })
			end,
			desc = "Toggle File Explorer",
		},
		{
			"<leader>fE",
			function()
				Snacks.explorer.reveal({ hidden = true, ignored = true })
			end,
			desc = "Reveal File Explorer",
		},
		{
			"<leader>uz",
			function()
				Snacks.zen.zen()
			end,
			desc = "Toggle Zen mode",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "LazyGit",
		},
	},
}
