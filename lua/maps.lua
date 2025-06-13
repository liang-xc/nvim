vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- New tab
vim.keymap.set("n", "te", ":tabedit<CR>")
vim.keymap.set("n", "<tab>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<s-tab>", ":tabprev<CR>", { noremap = true, silent = true })

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

-- Git
vim.keymap.set("n", "<leader>gi", vim.cmd.Git, { desc = "[Gi]t" })
vim.keymap.set("n", "<leader>gp", function()
  vim.cmd.Git("push")
end, { desc = "[G]it [P]ush", remap = false })
vim.keymap.set("n", "<leader>gr", function()
  vim.cmd.Git({ "pull", "--rebase" })
end, { desc = "[G]it Pull [r]ebase", remap = false })

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local nmap = function(keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end

      vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
    end

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Lesser used LSP functionality
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(ev.buf, "Format", function(_)
      vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
  end,
})

-- Telescope
-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require("telescope.builtin").live_grep({
      search_dirs = { git_root },
    })
  end
end

vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>ss", require("telescope.builtin").builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>si", require("telescope.builtin").git_files, { desc = "[S]earch G[i]t Files" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>sa", require("telescope").extensions.aerial.aerial, { desc = "[S]earch [A]erial Symbols" })

vim.keymap.set("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s/", function()
  require("telescope.builtin").live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
  require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

vim.api.nvim_set_keymap(
  "n",
  "<leader>b",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true, desc = "Telescope file [B]rowser" }
)

-- conform.nvim
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({
    timeout_ms = 5000,
    lsp_fallback = true,
    async = false,
  })
end, { desc = "[F]ormat file" })

-- aerial.nvim
vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "[A]erial Toggle" })

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndotree Toggle" })

-- oil.nvim
vim.keymap.set("n", "<space>o", "<CMD>Oil<CR>", { desc = "Open [O]il buffer" })
vim.keymap.set("n", "<leader>o", require("oil").toggle_float, { desc = "Open [O]il float" })

-- which-key chain docs
require("which-key").add({
  { "<leader>c", group = "[C]ode" },
  { "<leader>c_", hidden = true },
  { "<leader>d", group = "[D]ocument" },
  { "<leader>d_", hidden = true },
  { "<leader>g", group = "[G]it" },
  { "<leader>g_", hidden = true },
  { "<leader>s", group = "[S]earch" },
  { "<leader>s_", hidden = true },
  { "<leader>w", group = "[W]orkspace" },
  { "<leader>w_", hidden = true },
})
