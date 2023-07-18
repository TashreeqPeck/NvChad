local load_mappings = require("core.utils").load_mappings
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
      load_mappings "lazygit"
    end,
  },

  -- rename which-key prefix
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      local wk = require "which-key"
      wk.setup(opts)
      wk.register {
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
      }
    end,
  },

  -- add lsp support
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",
        "stylua",

        -- python
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "custom.configs.null_ls"
    end,
  },

  -- add dap support
  {
    "mfussenegger/nvim-dap",
    config = function()
      load_mappings "dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/Scripts/python"
      require("dap-python").setup(path)
      load_mappings "dap_python"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        if require("nvim-tree.view").is_visible() then
          vim.cmd "NvimTreeClose"
        end
        dapui.open()
      end
    end,
  },
}

return plugins
