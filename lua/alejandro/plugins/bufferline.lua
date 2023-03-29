local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

vim.opt.termguicolors = true

bufferline.setup({

	options = {
		numbers = "none",
		hover = {
			enable = true,
			delay = 2000,
			reveal = { "close" },
		},
		diagnostics = "nvim_lsp",
		separator_style = "thick",
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		buffer_close_icon = "?",
		modified_icon = "?",
		close_icon = "?",
		left_trunc_marker = "?",
		right_trunc_marker = "?",
		indicator = {
			-- icon = "| ",
			style = "underline",
		},
		items = {
			{
				name = "Tests",
				highlight = { underline = true, sp = "blue" },
				priority = 2,
				matcher = function(buf) -- Mandatory
					return buf.filename:match("%_test") or buf.filename:match("%_spec")
				end,
			},
			{
				name = "Docs",
				highlight = { undercurl = true, sp = "green" },
				auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
				matcher = function(buf)
					return buf.filename:match("%.md") or buf.filename:match("%.txt")
				end,
				separator = { -- Optional
					style = require("bufferline.groups").separator.tab,
				},
			},
		},
	},
})
