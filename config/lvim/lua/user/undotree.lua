vim.opt.undodir = os.getenv("HOME") .. "/.config/lvim/undodir"

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
