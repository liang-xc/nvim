vim.keymap.set("n", "<leader>s", ":w<Return>")
vim.keymap.set("n", "<leader>h", ":ClangdSwitchSourceHeader<Return>", { noremap = true, silent = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- New tab
vim.keymap.set("n", "te", ":tabedit")
vim.keymap.set("n", "<tab>", ":tabnext<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", { noremap = true, silent = true })

-- Split window
vim.keymap.set("n", "<space>ss", ":split<Return><C-w>w")
vim.keymap.set("n", "<space>sv", ":vsplit<Return><C-w>w")

-- Move window
vim.keymap.set("n", "<space><space>", "<C-w>w")
vim.keymap.set("n", "<space>h", "<C-w>h")
vim.keymap.set("n", "<space>k", "<C-w>k")
vim.keymap.set("n", "<space>j", "<C-w>j")
vim.keymap.set("n", "<space>l", "<C-w>l")

-- Move selected up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
