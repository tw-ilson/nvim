return {
	-- icons
	"nvim-tree/nvim-web-devicons",

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	{
		"nvim-treesitter/nvim-treesitter",
	},

	-- UI to select things (files, grep results, open buffers...)
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					window = {
						mappings = {
							["o"] = "system_open",
						},
					},
				},
				commands = {
					system_open = function(state)
						local os_name = vim.loop.os_uname().sysname
						local node = state.tree:get_node()
						local path = node:get_id()
						if os_name == "Darwin" then
							-- macOs: open file in default application in the background.
							vim.fn.jobstart({ "open", path }, { detach = true })
						elseif os_name == "Linux" then
							-- Linux: open file in default application
							vim.fn.jobstart({ "xdg-open", path }, { detach = true })
						elseif os_name == "Windows_NT" then
							-- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
							local p
							local lastSlashIndex = path:match("^.+()\\[^\\]*$") -- Match the last slash and everything before it
							if lastSlashIndex then
								p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
							else
								p = path -- If no slash found, return original path
							end
							vim.cmd("silent !start explorer " .. p)
						end
					end,
				},
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "sharkdp/fd" },
	},

	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Add indentation guides even on blank lines
	{ "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Smooth scrolling
	"psliwka/vim-smoothie",

	-- Auto Save
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				trigger_events = { "InsertLeave" },
			})
		end,
	},

	--Math in Ascii
	"jbyuki/nabla.nvim",

	-- Tmux integration
	-- {
	--  "aserowy/tmux.nvim",
	-- },

	-- Buffers as Tabs
	{ "romgrk/barbar.nvim", dependencies = "nvim-web-devicons" },
}
