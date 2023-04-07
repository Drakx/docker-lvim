if vim.bo.filetype == 'go' then
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.expandtab = false
end

if vim.bo.filetype == 'python' then
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.expandtab = true
end

vim.opt.relativenumber = true

lvim.colorscheme="tokyonight-night"
lvim.leader = ","

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.dap.active = true

lvim.builtin.treesitter.auto_install = true

lvim.format_on_save = {
  pattern = {"*.lua", "*.go", "*.py"}
}
