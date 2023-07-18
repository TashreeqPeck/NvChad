local M = {}

M.lazygit = {
  plugin = true,

  n = {
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Open LazyGit" },
  },
}

M.dap = {
  plugin = true,

  n = {
    ["<leader>dc"] = {
      function()
        if vim.fn.filereadable ".vscode/launch.json" then
          require("dap.ext.vscode").load_launchjs()
        end
        require("dap").continue()
      end,
      "DAP continue",
    },
    ["<leader>do"] = {
      function()
        if require("nvim-tree.view").is_visible() then
          vim.cmd "NvimTreeClose"
        end
        require("dapui").open()
      end,
      "Open debug ui",
    },
    ["<leader>dx"] = {
      function()
        require("dapui").close()
        if require("nvim-tree.view").is_visible() == false then
          vim.cmd "NvimTreeOpen"
          vim.cmd "bnext"
        end
      end,
      "Exit debug ui",
    },
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
  },
}

M.dap_python = {
  plugin = true,

  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

return M
