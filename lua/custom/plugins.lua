local plugins = {
  -- overwrite default nvim-tree options
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvimtree"
    end,
  },

  -- access lazygit inside nvim
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = { "LazyGit", "LazyGitFilter" },
    init = function()
      require("core.utils").load_mappings("lazygit")
    end,
  },

  -- rename which-key prefix
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
      })
    end,
  },

  -- add lsp support
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",

        -- python
        "black",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "custom.configs.null_ls"
    end
  }
}

return plugins
