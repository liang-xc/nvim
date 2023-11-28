require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
  },
  format_on_save = function(bufnr)
    local ignore_filetypes = { "python" }
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
})

vim.keymap.set({ "n", "v" }, "<space>f", function()
  require("conform").format({
    timeout_ms = 5000,
    lsp_fallback = true,
    async = false,
  })
end, { desc = "Format file" })
