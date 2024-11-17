vim.scriptencoding = "utf-8"
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

vim.o.autoindent = true
vim.o.backup = false
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.o.breakindent = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.o.expandtab = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.incsearch = true
vim.o.laststatus = 3 -- global status line
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 5
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.showtabline = 2
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.title = true
vim.o.wrap = false

if vim.fn.has("linux") then
  vim.opt.clipboard:append({ "unnamedplus" })
end

if vim.fn.has("win32") then
  vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
end

if vim.fn.has("linux") then
  vim.g.python3_host_prog = "/usr/sbin/python"
end

-- highlights
vim.o.termguicolors = true
vim.o.winblend = 0
vim.o.pumblend = 0
vim.o.background = "dark"

-- highlighting when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
