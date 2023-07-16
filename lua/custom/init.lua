local api = vim.api
local fn = vim.fn
local opt = vim.opt

-------------------------------------- options ------------------------------------------

-- turn on relative numbers
opt.relativenumber = true

-- change default shell
opt.shell = "pwsh"
opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
opt.shellquote = ''
opt.shellxquote = ''

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- close if file tree is last open buffer
autocmd("BufEnter", {
  pattern = "NvimTree*",
  callback = function()
    if #api.nvim_list_wins() == 1 and api.nvim_exec("ls +", true) == "" then
      vim.cmd("quit")
    end
  end
})

-- update file tree after using lazygit
autocmd("TermClose", {
  pattern = "*lazygit*",
  callback = function ()
    if fn.exists(":NvimTreeRefresh") == 2 then
      vim.cmd("NvimTreeRefresh")
    end
  end
})
-------------------------------------- commands ------------------------------------------
local new_cmd = vim.api.nvim_create_user_command

