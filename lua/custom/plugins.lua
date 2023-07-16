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
}

return plugins
