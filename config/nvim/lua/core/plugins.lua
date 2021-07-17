local packer_path = U.os.data .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)
end
--vim.cmd 'packadd packer.nvim | au BufWritePost plugins.lua PackerCompile'
--vim.opt.rtp = vim.opt.rtp + '~/.local/share/nvim/site/pack/packer/opt/*'

local packer = require('packer')
local plugin_path = U.os.data .. '/site/pack/packer/opt/'
local packer_compiled = U.os.data .. '/site/plugin/packer_compiled.vim'

return packer.startup(function(use)
  packer.init({compile_path = packer_compiled})

  -- Plugin Manager (manages itself)
  use 'wbthomason/packer.nvim'

  -- FZF file/content search
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use { 'junegunn/fzf.vim',
    after = 'fzf',
    setup = [[require('plugin.fzf')]]
  }
  --use { 'stsewd/fzf-checkout.vim',
  --  after = 'fzf',
  --  setup = [[require('plugin.fzf-checkout')]]
  --}
  --use { 'chengzeyi/fzf-preview.vim', after = 'fzf'}
  --use 'andymass/vim-matchup'

  -- Git
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-fugitive' }
  --use 'junegunn/gv.vim'


  -- File browser and quick fix list
  use 'francoiscabrol/ranger.vim'

  -- Colorschemes
  use 'crusoexia/vim-monokai'
  use 'rafi/awesome-vim-colorschemes'


  -- LSP Setup
  use {
    "folke/lsp-trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require('plugin.lsp-trouble')]]
  }
  use { 'RishabhRD/nvim-lsputils',
    requires = { 'RishabhRD/popfix' },
    config = [[require('plugin.nvim-lsputils')]],
  }

  use { 'jose-elias-alvarez/null-ls.nvim', requires = {
   'nvim-lua/plenary.nvim'
  }}

  use {
    'neovim/nvim-lspconfig',
    requires = {
      {'hrsh7th/nvim-compe', event = 'InsertEnter'},
      'kabouzeid/nvim-lspinstall',
      'glepnir/lspsaga.nvim',
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

  -- Autoinstall/compile plugins
  if vim.fn.isdirectory(vim.fn.glob(plugin_path)) > 0 then packer.install() end
  if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then packer.compile() end
end)
