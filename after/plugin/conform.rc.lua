require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.keymap.set({ "n", "v" }, "<space>f", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
  })
end, { desc = "Format file" })
