local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)  
return require('lazy').setup({
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

  -- icons
   'nvim-tree/nvim-web-devicons',

  -- UI to select things (files, grep results, open buffers...)
   {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      "MunifTanjim/nui.nvim"
	}
  },

   { 'nvim-telescope/telescope.nvim',
	  dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', 'sharkdp/fd' },
  },

  -- Status Line
  {
	  'nvim-lualine/lualine.nvim', 
	  dependencies = {'nvim-tree/nvim-web-devicons'}
  },

  -- Add indentation guides even on blank lines
   { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  {
      'nvim-treesitter/nvim-treesitter',
      config = require('nvim-treesitter.configs').setup {
        --   ensure_installed = { "lua", "rust", "toml" },
        --   auto_install = true,
        --   highlight = {
        --     enable = true,
        --     additional_vim_regex_highlighting=false,
        --   },
        --   ident = { enable = true }, 
        --   rainbow = {
        --     enable = true,
        --     extended_mode = true,
        --     max_file_lines = nil,
        --   }
        }
  },

  -- Smooth scrolling
   'psliwka/vim-smoothie',

  -- Auto Save
   {
	"Pocco81/auto-save.nvim",
	config = function()
           require("auto-save").setup {
               trigger_events= {"InsertLeave"}
       }
        end,
  },

  -- Tmux integration
   -- {
   --  "aserowy/tmux.nvim",
   -- },

  -- Buffers as Tabs
   {'romgrk/barbar.nvim', dependencies = 'nvim-web-devicons'},

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
    {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    },

  -- Debug
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'ldelossa/nvim-dap-projects',

  --  {
  --   'nvim-neorg/neorg',
  --   config = function()
  --       require('neorg').setup {
  --           load = {
  --               ["core.defaults"] = {}, -- Loads default behaviour
  --               ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
  --               ["core.norg.dirman"] = { -- Manages Neorg workspaces
  --                   config = {
  --                       workspaces = {
  --                           notes = "~/Sync/notes",
  --                       },
  --                   },
  --               },
  --           },
  --       }
  --   end,
  --   run = ":Neorg sync-parsers",
  --   dependencies = "nvim-lua/plenary.nvim",
  -- },

  --Math in Ascii
   'jbyuki/nabla.nvim',
})
