-- comentar codigo
vim.api.nvim_set_keymap("n", "cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})
