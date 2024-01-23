vim.opt_local.cindent = true
vim.opt_local.cino = { "g1", "t0" }

vim.keymap.set("n", "<leader>x", vim.cmd.ClangdSwitchSourceHeader, { desc = "Clangd switch source header" })
