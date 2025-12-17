return {
	"dmtrKovalenko/fff.nvim",
	build = "cargo build --release",
	lazy = false,

	-- or if you are using nixos
	-- build = "nix run .#release",
	opts = {
		-- pass here all the options
		keymaps = {
			move_up = { "Up", "<Tab>" },
			move_down = { "Down", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			select = { "<CR>", "<Enter>" },
		},
		-- Image preview (requires terminal with image support)
		image_preview = {
			enabled = true, -- Enable image previews
			max_width = 80, -- Maximum image width in columns
			max_height = 24, -- Maximum image height in lines
		},

		-- Icons
		icons = {
			enabled = true, -- Enable file icons
		},
	},
	keys = {
		{
			"ff", -- try it if you didn't it is a banger keybinding for a picker
			function()
				require("fff").find_files() -- or find_in_git_root() if you only want git files
			end,
			desc = "Open file picker",
		},
	},
}
