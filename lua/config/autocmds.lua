local api = vim.api

-- Highlight on Yank: Φωτίζει το κείμενο όταν κάνεις copy
api.nvim_create_autocmd("TextYankPost", {
	group = api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Auto Save on Insert Leave
api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = { "*" },
	command = "silent! update",
	nested = true,
})

-- Σβήνει αυτόματα τα περιττά κενά στο τέλος της γραμμής όταν σώζεις
api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})
