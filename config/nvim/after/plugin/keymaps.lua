local opts = { noremap = true, silent = true }
--

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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
keymap("n", "<leader>z", "za", opts)
-- keymap("n", "<Space>R", "zR", opts)

-- Stop highlight with comma spacebar
keymap("n", "<leader><Space>", ":set nohlsearch<CR>", opts)

-- Resize windows by using alt + hjkl
keymap("n", "M-j", ":resize -2<CR>", opts)
keymap("n", "M-k", ":resize +2<CR>", opts)
keymap("n", "M-h", ":vertical resize -2<CR>", opts)
keymap("n", "M-l", ":vertical resize +2<CR>", opts)

-- highlighted text can be moved
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '.-2<CR>gv=gv", opts)
