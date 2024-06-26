return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
    },
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in lsp
    "hrsh7th/cmp-cmdline", -- nvim-cmp source for command
    "hrsh7th/cmp-path", -- nvim-cmp source for path
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")
    luasnip.config.set_config({
      history = false,
      updateevents = "TextChanged, TextChangedI",
    })

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Inser, select = true }),
          { "i", "c" }
        ),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      }),

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
    })
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
      loadfile(ft_path)()
    end

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })
  end,
}
