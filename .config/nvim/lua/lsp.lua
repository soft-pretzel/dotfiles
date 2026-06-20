-- Plugins
vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/ms-jpq/coq_nvim",
	"https://github.com/ms-jpq/coq.artifacts",
	"https://github.com/ms-jpq/coq.thirdparty",
})

-- Language servers
require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"bashls",
		"shfmt",
		"ts_ls",
		"prettier",
		"jsonls",
		"lua_ls",
		"stylua",
		"rust-analyzer",
	},
})
require("mason-lspconfig").setup()

-- Formatting
require("conform").setup({
	formatters_by_ft = {
		bash = { "shfmt" },
		javascript = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		rust = { "rustfmt", "dioxus" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- Autocompletion
vim.g.coq_settings = {
	auto_start = true,
	display = {
		icons = {
			mode = "short",
		},
		pum = {
			y_max_len = 5,
			x_max_len = 25,
			kind_context = { "", "" },
			source_context = { "[", "]" },
		},
		statusline = {
			helo = false,
		},
	},
	keymap = {
		recommended = false,
	},
}

-- Fix autoindent with nvim-autopairs + coq_nvim
local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")

npairs.setup({ map_bs = false, map_cr = false })

remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

_G.MUtils = {}

MUtils.CR = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ "selected" }).selected ~= -1 then
			return npairs.esc("<c-y>")
		else
			return npairs.esc("<c-e>") .. npairs.autopairs_cr()
		end
	else
		return npairs.autopairs_cr()
	end
end
remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

MUtils.BS = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
		return npairs.esc("<c-e>") .. npairs.autopairs_bs()
	else
		return npairs.autopairs_bs()
	end
end
remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })
