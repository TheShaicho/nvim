return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.cmd("colorscheme oxocarbon")

			local api = vim.api
			api.nvim_set_hl(0, "TelescopeBorder", { fg = "#393939", bg = "NONE" })
			api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#393939", bg = "NONE" })
			api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#393939", bg = "NONE" })
			api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#393939", bg = "NONE" })
		end,
	},
}
