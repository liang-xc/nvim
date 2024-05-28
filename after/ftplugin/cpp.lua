vim.opt_local.cindent = true
vim.opt_local.cino = { "g1", "t0" }
vim.opt_local.colorcolumn = "80"

vim.keymap.set("n", "<leader>x", vim.cmd.ClangdSwitchSourceHeader, { desc = "Clangd switch source header" })
