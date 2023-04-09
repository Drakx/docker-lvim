local opts = { noremap = true, silent = true }
--

-- leader key
-- vim.g.mapleader = ','

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- vim.keymap.set('n', '<leader>ed', vim.diagnostic.open_float, { silent = true, desc = "Open floating diagnostic message" })
-- vim.keymap.set('n', "<leader>ee", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tab navigation while in normal mode
keymap("n", "<TAB>", ":bnext<CR>", opts)
-- Shift TAB to go back
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
--
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
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-1<CR>gv=gv", opts)
