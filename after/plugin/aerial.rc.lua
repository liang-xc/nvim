require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards
    vim.keymap.set("n", "<C-[>", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "<C-]>", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,

  layout = {
    max_width = { 60, 0.375 },
  },
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
