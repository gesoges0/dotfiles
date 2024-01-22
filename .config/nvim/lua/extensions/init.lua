-- https://coralpink.github.io/commentary/neovim/plugin/packer.html
require('packer').startup { function()
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'extensions.nvim-treesitter' end,
  }
  -- https://coralpink.github.io/commentary/neovim/plugin/onenord.html
  use {
    'rmehri01/onenord.nvim',
    config = function() require 'extensions.onenord' end,
  }
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  }
}}
