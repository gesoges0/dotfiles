-- https://coralpink.github.io/commentary/neovim/plugin/packer.html
require("packer").startup({
	function()
		use("wbthomason/packer.nvim")
		use({
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("extensions.nvim-treesitter")
			end,
		})
		-- https://coralpink.github.io/commentary/neovim/plugin/onenord.html
		use({
			"rmehri01/onenord.nvim",
			config = function()
				require("extensions.onenord")
			end,
		})
		-- https://coralpink.github.io/commentary/neovim/plugin/lualine.html
		-- https://coralpink.github.io/commentary/neovim/plugin/lualine-part2.html
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("extensions.lualine")
			end,
			requires = { "nvim-tree/nvim-web-devicons" },
		})
		-- https://coralpink.github.io/commentary/neovim/plugin/nvim-hlslens.html
		use({
			"kevinhwang91/nvim-hlslens",
			config = function()
				require("extensions.nvim-hlslens")
			end,
		})
		-- https://coralpink.github.io/commentary/neovim/plugin/gitsigns.html
		use({
			"lewis6991/gitsigns.nvim",
			-- tag = 'release',
			config = function()
				require("extensions.gitsigns")
			end,
		})
 	        -- https://coralpink.github.io/commentary/neovim/plugin/nvim-scrollbar.html
        	use ({
	            'petertriho/nvim-scrollbar',
        	    config = function() require 'extensions.nvim-scrollbar' end,
	            requires = {
        		'kevinhwang91/nvim-hlslens', 
			'lewis6991/gitsigns.nvim' 
		    },
	        })
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
