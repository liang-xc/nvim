vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.scrolloff = 5
vim.opt.inccommand = 'split'
vim.opt.backup = false
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

if vim.fn.has("linux") then
  vim.opt.clipboard:append { 'unnamedplus' }
end
if vim.fn.has("win32") then
  vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
end

-- python specific indent
vim.cmd [[ autocmd FileType python setlocal ts=4 sts=4 sw=4 ]]

-- C-indenting
vim.cmd [[ autocmd FileType cpp setlocal ts=2 sts=2 sw=2 ]]
vim.opt.cindent = true
vim.opt.cino = 'g0, t0'

-- highlights
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
vim.opt.colorcolumn = '80'
vim.cmd [[ highlight ColorColumn ctermbg=0 guibg=#4c566a ]]
