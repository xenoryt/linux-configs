local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  ensure_installed = {
    'norg',
    'bash',
    'c',
    'cpp',
    'css',
    'dockerfile',
    'go',
    'gomod',
    'graphql',
    'hcl',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'python',
    'toml',
    'typescript',
    'vim',
  },
  indent = {enable = true},
  autopairs = {enable = true},
  rainbow = {enable = true},
  autotag = {enable = true},
  context_commentstring = {enable = true},

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      scope_incremental = 'grc',
      node_incremental = 'grn',
      node_decremental = 'grm',
    }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          javascript = "(function_definition) @function",
          javascriptreact = "(function_definition) @function",
          typescript = "(function_definition) @function",
          typescriptreact = "(function_definition) @function",
        },
      },
    },
  },
}
