return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions
			local api = vim.api

			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
						},
						width = 0.80,
						height = 0.87,
					},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_previous,
							["<C-k>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
						n = {
							["j"] = actions.move_selection_previous,
							["k"] = actions.move_selection_next,

							["q"] = actions.close,
							["<Esc>"] = actions.close,
						},
					},
				},
				extensions = {
					file_browser = {
						hijack_netrw = true,
						hidden = true,
						grouped = true,
						previewer = true,
						initial_mode = "normal",
						mappings = {
							["n"] = {
								["h"] = fb_actions.goto_parent_dir,
								["l"] = actions.select_default,
							},
						},
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")

			local purple = "#c678dd"
			api.nvim_set_hl(0, "TelescopeBorder", { fg = purple, bg = "none" })
			api.nvim_set_hl(0, "TelescopePromptBorder", { fg = purple, bg = "none" })
			api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = purple, bg = "none" })
			api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = purple, bg = "none" })
			api.nvim_set_hl(0, "TelescopeTitle", { fg = purple, bg = "none" })
		end,
	},
}
