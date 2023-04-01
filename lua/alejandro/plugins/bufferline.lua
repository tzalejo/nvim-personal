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
		separator_style = "slant", --"thick",
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

				if error ~= 0 then
					table.insert(result, { text = "  " .. error, fg = "#EC5241" })
				end

				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
				end

				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
				end

				if info ~= 0 then
					table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
				end
				return result
			end,
		},
		indicator = {
			icon = "| ",
			style = "icon",
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

vim.cmd([[
nnoremap <silent> <TAB> :BufferLineCycleNext<CR>
nnoremap <silent> <S-TAB> :BufferLineCyclePrev<CR>
]])
