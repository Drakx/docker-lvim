lvim.leader = ","

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tab navigation while in normal mode
keymap("n", "<TAB>", ":bnext<CR>", opts)
-- Shift TAB to go back
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Paste
keymap("n", "<F2>", ":set invpaste paste?<CR>", opts)

-- Fold with spacebar
keymap("n", "<Space>", "za", opts)

-- Stop highlight with comma spacebar
keymap("n", "<leader><Space>", ":set nohlsearch<CR>", opts)

-- Resize windows by using alt + hjkl
keymap("n", "M-j", ":resize -2<CR>", opts)
keymap("n", "M-k", ":resize +2<CR>", opts)
keymap("n", "M-h", ":vertical resize -2<CR>", opts)
keymap("n", "M-l", ":vertical resize +2<CR>", opts)

-- highlighted text can be moved
keymap("v", "K", ":m '>+1<CR>gv=gv", opts)
keymap("v", "J", ":m '<-1<CR>gv=gv", opts)

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

