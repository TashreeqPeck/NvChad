---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvbox",
  tabufline = {
    lazyload = false,
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
