-- lualine helper functions
local function get_python_venv()
  if vim.bo.filetype ~= "python" then
    return ""
  end
  if os.getenv("VIRTUAL_ENV") == nil then
    return "System"
  end
  return os.getenv("VIRTUAL_ENV"):match("[^/\\]+$")
end

local function icon()
  return ""
end

local function trailing_whitespace_line()
  local space = vim.fn.search([[\s\+$]], "nwc")
  return space ~= 0 and "twl #" .. space or ""
end

return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
    opts = {
      layout = {
        max_width = { 40, 0.5 },
        min_width = { 20, 0.3 },
      },

      float = {
        relative = "win",
      },

      close_on_select = false,
    },
  },
  { "tpope/vim-fugitive", lazy = true },
  { "lewis6991/gitsigns.nvim", opts = {} },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          { get_python_venv },
          {
            "filename",
            file_status = true,
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          "encoding",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {
          "filename",
          file_status = true,
          path = 1,
        } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = { icon },
        lualine_b = { "fileformat" },
        lualine_c = {
          {
            "tabs",
            tab_max_length = 40,
            max_length = vim.o.columns / 3,
            mode = 1,
            path = 0,
            use_mode_colors = true,
            tabs_color = {
              active = "lualine_c_normal",
              inactive = "lualine_c_inactive",
            },
          },
        },
        lualine_x = { trailing_whitespace_line },
        lualine_y = {
          {
            "aerial",
            sep = ")",
            depth = 1,
            colored = true,
          },
        },
        lualine_z = {
          {
            "windows",
            show_file_name_only = true,
            show_modified_status = true,
            mode = 1,
            max_length = vim.o.columns * 2 / 3,
            filetype_names = {
              TelescopePrompt = "Telescope",
            },
            disabled_buftypes = { "quickfix" },
            use_mode_colors = true,
            windows_color = {
              active = "lualine_z_normal",
              inactive = "lualine_z_inactive",
            },
          },
        },
      },
      extensions = { "aerial" },
    },
  },
}
