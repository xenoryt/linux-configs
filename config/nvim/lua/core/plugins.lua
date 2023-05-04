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

-- Split the plugins into different categories to make it simpler to select which plugins to install on each system
-- The list of plugins to install are set in the loadPlugins variable
local pluginCategories = {

  -- BASIC PLUGINS: Provides basic keymaps/navigation
  basic = {
    -- Colorschemes
    { 'crusoexia/vim-monokai' },
    { 'rafi/awesome-vim-colorschemes' },

    -- FZF file/content search
    { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' },
    { 'ibhagwan/fzf-lua',
      after = 'fzf',
      requires = {
        'vijaymarupudi/nvim-fzf',
        'kyazdani42/nvim-web-devicons' -- optional for icons
      },
      setup = [[require('plugin.fzf-lua')]]
    },
    { 'ojroques/nvim-osc52', config = [[require('plugin.nvim-osc52')]] }
  },


  -- File browser and quick fix list
  files = {
    { 'francoiscabrol/ranger.vim' },
    --{
    --  'ms-jpq/chadtree',
    --  branch = 'chad',
    --  run = 'python3 -m chadtree deps',
    --  config = [[require('plugin.chadtree')]],
    --},
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
          -- only needed if you want to use the commands with "_with_window_picker" suffix
          's1n7ax/nvim-window-picker',
          tag = "1.*",
          config = function()
            require 'window-picker'.setup({
              autoselect_one = true,
              include_current = false,
              filter_rules = {
                -- filter using buffer options
                bo = {
                  -- if the file type is one of following, the window will be ignored
                  filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix" },

                  -- if the buffer type is one of following, the window will be ignored
                  buftype = { 'terminal' },
                },
              },
              other_win_hl_color = '#e35e4f',
            })
          end,
        }
      },
      config = [[require('plugin.neo-tree')]]
    },
    --{
    --  'kyazdani42/nvim-tree.lua',
    --  requires = {'kyazdani42/nvim-web-devicons'},
    --  config = [[require('plugin.nvim-tree')]]
    --},
  },


  lsp = {
    {
      "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = [[require('plugin.lsp-trouble')]]
    },
    -- { 'RishabhRD/nvim-lsputils',
    --   requires = { 'RishabhRD/popfix' },
    --   config = [[require('plugin.nvim-lsputils')]],
    -- },

    { "lukas-reineke/lsp-format.nvim" },
    {
      'neovim/nvim-lspconfig',
      requires = {
        { 'hrsh7th/nvim-compe', config = [[require('plugin.nvim-compe')]], opt = false },
        --'williamboman/nvim-lsp-installer',
        --'glepnir/lspsaga.nvim',
        'folke/lsp-colors.nvim', -- for better colourschemes
        'jose-elias-alvarez/nvim-lsp-ts-utils',
      },
      config = [[require('plugin.nvim-lspconfig.init')]],
    },
    {
      'williamboman/mason.nvim',
      setup = [[require('plugin.mason')]],
      run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    {
      'williamboman/mason-lspconfig.nvim',
      setup = [[require('plugin.mason-lspconfig')]],
    }

    -- {
    --   'glepnir/lspsaga.nvim',
    --   config = [[require('plugin.lspsaga')]],
    -- },
  },

  language = {
    -- Go
    {
      'ray-x/go.nvim',
      after = { 'nvim-lspconfig' },
      config = [[require('plugin.go')]]
    },
    { 'sebdah/vim-delve' },
  },

  -- EXTRA: plugins that provide extra functionality
  extra = {
    -- GIT plugins
    {
      'dinhhuy258/git.nvim',
      config = { [[require('plugin.git')]] }
    },
    {
      'github/copilot.vim'
    },
    --{
    --  'ldelossa/gh.nvim',
    --  after = 'folke/which-key.nvim',
    --  requires = { 'ldelossa/litee.nvim' },
    --  config = { [[require('plugin.gh')]] }
    --},
    {
      'TimUntersberger/neogit',
      requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
      config = { [[require('plugin.neogit')]] }
    },
    {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = { [[require('plugin.gitsigns')]] }
    },
    {
      'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim',
    },

    -- Keybinding
    {
      'folke/which-key.nvim',
      config = { [[require('plugin.which-key')]] }
    },

    -- Note taking
    --{
    --  "nvim-neorg/neorg",
    --  requires = {
    --    "nvim-neorg/neorg-telescope",
    --    "nvim-lua/plenary.nvim"
    --  },

    --  after = "nvim-treesitter",
    --  config = [[require('plugin.neorg')]],
    --},

    -- TreeSitter
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require('plugin.nvim-treesitter')]],
    },
    -- Vimpeccable
    --{
    --  'svermeulen/vimpeccable',
    --  setup = [[require('plugin.vimpeccable.keymaps')]]
    --},
  }
}

-- The list of plugins to install & load.
local loadPlugins = {
  pluginCategories.basic,
  pluginCategories.files,
  pluginCategories.lsp,
  pluginCategories.language,
  pluginCategories.extra,
}

return packer.startup(function(use)
  packer.init({ compile_path = packer_compiled })

  -- Plugin Manager (manages itself)
  use 'wbthomason/packer.nvim'

  for _, pluginList in ipairs(loadPlugins) do
    for _, plugin in ipairs(pluginList) do
      use(plugin)
    end
  end

  -- use {
  --   'lambdalisue/fern.vim',
  --   requires = {
  --     'lambdalisue/nerdfont.vim'
  --   },
  --   config = function()
  --     vim.api.nvim_set_var('fern#renderer', 'nerdfont')
  --   end
  -- }

  -- Autoinstall/compile plugins
  if vim.fn.isdirectory(vim.fn.glob(plugin_path)) > 0 then packer.install() end
  if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then packer.compile() end
end)
