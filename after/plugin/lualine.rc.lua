local function get_python_venv()
  if vim.bo.filetype ~= "python" then
    return ""
  end
  if os.getenv("VIRTUAL_ENV") == nil then
    return "System"
  end
  return os.getenv("VIRTUAL_ENV"):match("[^/\\]+$")
end

require("lualine").setup({
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
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
  tabline = {},
  extensions = {},
})
