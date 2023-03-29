vim.g.mapleader = " "

local keymap = vim.keymap --for consisenes

-- Mapping helper
local mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

---------------------
-- General Keymaps
---------------------

mapper("i", "jj", "<ESC>")

-- para que al eliminar un caracter no lo copie.
mapper("n", "x", '"_x')

-- para cerrar una ventana que tmb se puede hacer con leader + q
mapper("n", "<Leader>sx", ":close<CR>")

-- Git messenger
mapper("n", "<Leader>gm", "<Plug>(git-messenger)<CR>")

-- Para recargar un archivo de forma manual
mapper("n", "<Leader>s", ":so<CR>")

-- Save and Close
mapper("n", "<Leader>w", ":w!<CR>")
mapper("n", "<Leader>q", ":q<CR>")
mapper("n", "mq", ":qa!<CR>")
mapper("n", "qq", ":q!<CR>")

-- Abre una ventana
-- mapper("n", "<Leader>V", ":vsplit<CR>")

mapper("n", "<esc>", ":noh<return><esc>")

-- Duplitcate Line
mapper("n", "tt", ":t.<CR>")

-- comentar codigo
mapper("n", "cc", "<Plug>kommentary_line_default")
mapper("n", "gc", "<Plug>kommentary_visual_default<C-c>")

mapper("n", "<Leader>to", ":TodoTelescope<CR>")

-- Busqueda en un archivo
-- Hop.nvim
mapper("n", "f", ":HopWord<CR>")
mapper("n", "F", ":HopPattern<CR>")
mapper("n", "ff", ":HopChar2<CR>")

-- Menu desplegable NERDTree
mapper("n", "<Leader>nt", ":NvimTreeOpen<CR>")
mapper("n", "<Leader>nn", ":NvimTreeClose<CR>")
mapper("n", "<Leader>nu", ":NvimTreeRefresh<CR>")

-- Resize with arrows
mapper("n", "<C-Up>", ":resize -2<CR>")
mapper("n", "<C-Down>", ":resize +2<CR>")
mapper("n", "<C-Left>", ":vertical resize +2<CR>")
mapper("n", "<C-Right>", ":vertical resize -2<CR>")

-- Better window movement
mapper("n", "<C-h>", "<C-w>h")
mapper("n", "<C-j>", "<C-w>j")
mapper("n", "<C-k>", "<C-w>k")
mapper("n", "<C-l>", "<C-w>l")

--Agregar ventana
mapper("n", "<Leader>va", ":split<CR>") -- ventana arriba
mapper("n", "<Leader>vi", ":vsplit<CR>") -- ventana izquierda

-- Cerrar una buffer
mapper("n", "<C-w>", ":Bdelete<CR>")

-- telescope
mapper("n", "<Leader>fs", "<cmd>Telescope find_files<cr>")
mapper("n", "<Leader>fs", "<cmd>Telescope find_files<cr>")
mapper("n", "<Leader>ft", "<cmd>Telescope live_grep<cr>")
mapper("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>")

-- Better window movement
mapper("n", "<C-h>", "<C-w>h")
mapper("n", "<C-j>", "<C-w>j")
mapper("n", "<C-k>", "<C-w>k")
mapper("n", "<C-l>", "<C-w>l")
