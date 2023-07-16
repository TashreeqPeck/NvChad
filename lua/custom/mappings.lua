local M = {}

M.lazygit = {
  plugin = true,

  n = {
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Open LazyGit" },
  },
}

return M
