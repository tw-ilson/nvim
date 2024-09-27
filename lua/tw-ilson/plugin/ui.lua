return {
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

  --Math in Ascii
   'jbyuki/nabla.nvim',

  -- Tmux integration
   -- {
   --  "aserowy/tmux.nvim",
   -- },

  -- Buffers as Tabs
   {'romgrk/barbar.nvim', dependencies = 'nvim-web-devicons'},
}
