return {
    -- LSP Package mangement
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
   {
	  'numToStr/Comment.nvim',-- "gc" to comment visual regions/lines
	  config = function ()
		  require('Comment').setup()
	  end
  },
  -- LSP Config tools
   {
	  'VonHeikemen/lsp-zero.nvim',
          branch='v3.x',
	  dependencies = {
		  -- LSP Support
		  'neovim/nvim-lspconfig',
		  'williamboman/mason.nvim',
		  'williamboman/mason-lspconfig.nvim',

		  -- Autocompletion
                  {'hrsh7th/nvim-cmp', commit='b356f2c'}, -- bugged on latest release
		  'hrsh7th/cmp-nvim-lsp',
		  'hrsh7th/cmp-buffer',
		  'hrsh7th/cmp-path',
		  'hrsh7th/cmp-nvim-lua',
		  'hrsh7th/cmp-cmdline',

		  -- Snippets
                  'L3MON4D3/LuaSnip',
                  'saadparwaiz1/cmp_luasnip',
              },
  },

  -- Formatter
   'sbdchd/neoformat',

  -- Rust
   {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { "BufRead Cargo.toml" },
    config = function()
        require('crates').setup()
    end,
    },

  -- Markdown
    -- {
    -- "OXY2DEV/markview.nvim",
    -- lazy = false,      -- Recommended
    -- },
}
