local status, packer = pcall(require, 'packer')
if not status then
  return
end
-- vim.cmd.packadd("packer.nvim")

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use({ 'catppuccin/nvim', as = 'catpuccin' })

  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  })

  -- Para realizar comentarios
  use 'b3nj5m1n/kommentary'


  -- Para resaltar y buscar comentarios de tareas pendientes como TODO:, en su base HACKde BUGcódigo.
  -- FIX: otro error de prueba

  use {
	  'folke/todo-comments.nvim',
	  requires = 'nvim-lua/plenary.nvim',
	  config = function()
		  require("todo-comments").setup {
			  -- your configuration comes hereby
			  -- or leave it empty to use the default settings
			  -- refer to the configuration section below
		  }
	  end
  }

  -- Una línea de estado de Neovim increíblemente rápida y fácil de configurar escrita en Lua.
  use {  'nvim-lualine/lualine.nvim' }
  -- icons
  use { 'kyazdani42/nvim-web-devicons' }

  --Permite saltar a cualquier parte de un documento con la menor cantidad de pulsaciones de teclas posible
  use {"phaazon/hop.nvim"}


  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }


  -- Terminal
  use {
    'akinsho/toggleterm.nvim', tag = '*', config = function()
      require("toggleterm").setup()
    end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Para menejo de tabs(buffer)
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  -- Permite eliminar búferes (cerrar archivos) sin cerrar sus ventanas o estropear su diseño.
  use {'moll/vim-bbye'}

  -- Es un complemento de neovim para revelar rapidamente el msg oculta de git debajo del cursor.
  use {'rhysd/git-messenger.vim'}

  -- tmux y split para navegar entre las ventanas..
  use { 'christoomey/vim-tmux-navigator' }

  -- essential plugins
  --  Press cs"' inside or press cst" or press ysiw] or parentheses with yssb or yss(
  use {'tpope/vim-surround'} -- add, delete, change surroundings (it's awesome)
  use {'inkarkat/vim-ReplaceWithRegister'} -- replace with register contents using motion (gr + motion)

end)
