-- Short aliases
local g,o,bo,wo,cmd,fn = vim.g,vim.o,vim.bo,vim.wo,vim.cmd,vim.fn

g.mapleader = " "

vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.swapfile = false

vim.opt.signcolumn = 'yes'

-- Syntax on!
g.syntax_on = true
o.synmaxcol = 1500

-- comando que elimina los espcio en blanco
cmd([[autocmd BufWritePre * :%s/\s\+$//e ]])

-- Fold Stuff
wo.foldenable = false
wo.foldnestmax = 10
wo.foldmethod = "syntax"

-- Work with several buffers
o.hidden = true

-- Numbers
wo.number = true
o.number = true

-- Relative Numbers!
wo.relativenumber = true
o.relativenumber = true

-- Nice Time
o.updatetime = 250

-- When line is longer than the screen, it continues on the next line
wo.wrap = false
o.wrap = false
-- But don't break words, only 'by words'
wo.linebreak = true

-- Tabs to Spaces
o.expandtab = true
bo.expandtab = true

-- Correct level of indentation
o.shiftwidth = 2
bo.shiftwidth = 2

-- I have a special configuration for each file in ftplugin/
o.softtabstop = 4
bo.softtabstop = 4

-- Autoident
o.autoindent = true
bo.autoindent = true

-- Highlight all matches while searching
o.incsearch = true
o.hlsearch = true

-- Ignorecase ins search pattern
o.ignorecase = true

-- Override the 'ignorecase' option if the search pattern contains upper case characters
o.smartcase = true

-- Will put the new window below the currentone. (:sp)
o.splitbelow = true

-- Will put the new window right of the current one. (:vs)
o.splitright = true

-- When and how to draw the signcolumn
o.signcolumn = 'yes'

-- Swapfiles are nice
o.swapfile = true

-- RipGrep needed
o.grepprg = "rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs"
o.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- Important
o.completeopt = "menuone,noinsert,noselect"

-- Very lazy please
o.lazyredraw = true

-- Error Format
o.errorformat = o.errorformat .. ',%f'

-- Share Clipboard between the system and nvim
o.clipboard = 'unnamedplus'

-- Necesary
-- cmd('filetype plugin indent on')
cmd([[
filetype plugin indent on
nnoremap <silent> <M-Up>    :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``
nnoremap <silent> <M-Down>  :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``
vnoremap <silent> <M-Up>    :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv
vnoremap <silent> <M-Down>  :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv
nnoremap <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
]])

-- cuando navego centro la pantalla
cmd([[
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
]])
-- Visually select and copy without line numbers
o.mouse = "a"

-- Don't redraw while executing macros
o.ttyfast = true

-- Set zsh as shell (which zsh)
o.shell = "/usr/bin/zsh"

-- Highlight the screen line of the cursor with CursorLine
wo.cursorline = false

-- Enables 24-bit RGB color in TUI
o.termguicolors = true

-- Dark Background
o.background = "dark"

-- Use Emoji
o.emoji = true

-- File Format
o.ff = "unix"

