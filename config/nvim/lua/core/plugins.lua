local packer_path = U.os.data .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  print('Cloning packer...')
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)
end
vim.cmd 'packadd packer.nvim | au BufWritePost plugins.lua PackerCompile'
vim.opt.rtp = vim.opt.rtp + '~/.local/share/nvim/site/pack/packer/opt/*'

local packer = require('packer')
local plugin_path = U.os.data .. '/site/pack/packer/opt/'
local packer_compiled = U.os.data .. '/site/plugin/packer_compiled.vim'

return packer.startup(function(use)
  packer.init({compile_path = packer_compiled})

  -- Plugin Manager (manages itself)
  use 'wbthomason/packer.nvim'

  -- Colorschemes
  use 'crusoexia/vim-monokai'
  use 'rafi/awesome-vim-colorschemes'

  use {
    "nvim-neorg/neorg",
    requires = {
      --"nvim-neorg/neorg-telescope",
      "nvim-lua/plenary.nvim"
    },

    after = "nvim-treesitter",
    config = [[require('plugin.neorg')]],
    branch = "main",
  }

  --use 'Yggdroot/indentLine'

  -- FZF file/content search
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use { 'junegunn/fzf.vim',
    opt = false,
    after = 'fzf',
    setup = {[[require('plugin.fzf')]]}
  }
  --use { 'stsewd/fzf-checkout.vim',
  --  after = 'fzf',
  --  setup = [[require('plugin.fzf-checkout')]]
  --}
  --use { 'chengzeyi/fzf-preview.vim', after = 'fzf'}
  --use { 'yuki-yano/fzf-preview.vim', after = 'fzf', branch = 'release/remote', run = ':UpdateRemotePlugins'}
  --use 'andymass/vim-matchup'

  -- Git
  use {
    'TimUntersberger/neogit',
    requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
    config = {[[require('plugin.neogit')]]}
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = [[require('plugin.gitsigns')]]
  }
  --use 'junegunn/gv.vim'
  --use { 'tpope/vim-fugitive' }


  -- File browser and quick fix list
  use 'francoiscabrol/ranger.vim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = [[require('plugin.nvim-tree')]]
  }

  -- use {
  --   'lambdalisue/fern.vim',
  --   requires = {
  --     'lambdalisue/nerdfont.vim'
  --   },
  --   config = function()
  --     vim.api.nvim_set_var('fern#renderer', 'nerdfont')
  --   end
  -- }

  -- LSP Setup
  use {
    "folke/lsp-trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require('plugin.lsp-trouble')]]
  }
  -- use { 'RishabhRD/nvim-lsputils',
  --   requires = { 'RishabhRD/popfix' },
  --   config = [[require('plugin.nvim-lsputils')]],
  -- }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      {'hrsh7th/nvim-compe', config = [[require('plugin.nvim-compe')]], opt = false},
      'kabouzeid/nvim-lspinstall',
      'glepnir/lspsaga.nvim',
      'folke/lsp-colors.nvim', -- for better colourschemes
      'jose-elias-alvarez/nvim-lsp-ts-utils',
    },
    config = [[require('plugin.nvim-lspconfig.init')]],
  }

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('plugin.nvim-treesitter')]],
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
    config = [[require('plugin.telescope')]]
  }
  use {'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    after = 'telescope.nvim',
    config = [[require('plugin.telescope-fzf')]]
  }

  -- Vimpeccable
  use {
    'svermeulen/vimpeccable',
    setup = [[require('plugin.vimpeccable.keymaps')]]
  }

  -- Autoinstall/compile plugins
  if vim.fn.isdirectory(vim.fn.glob(plugin_path)) > 0 then packer.install() end
  if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then packer.compile() end
end)
