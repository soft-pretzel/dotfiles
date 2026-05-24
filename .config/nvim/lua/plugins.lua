-- Plugins
vim.pack.add({
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/lewis6992/gitsigns.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
	"https://github.com/nvim-mini/mini.indentscope",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/kylechui/nvim-surround",
	"https://github.com/xzbdmw/colorful-menu.nvim",
	"https://github.com/abecodes/tabout.nvim",
	"https://github.com/mg979/vim-visual-multi",
	"https://github.com/catgoose/nvim-colorizer.lua",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/stevearc/oil.nvim",
})

-- Config
require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close,
			},
		},
	},
})
require("gitsigns").setup()
require("lualine").setup()
require("tiny-inline-diagnostic").setup()
vim.diagnostic.config({ virtual_text = false })
require("mini.indentscope").setup({ symbol = "│" })
require("colorful-menu").setup()
require("tabout").setup()
require("colorizer").setup()
require("fidget").setup()
vim.notify = require("notify")
require("oil").setup()
