vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1]])
return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {
      -- vim.keymap.set('n', "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neotree" }),
      filesystem = {
        follow_current_file = true
      },
      buffers = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
      },
      enable_git_status = true,
    }
    -- vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
  end,
}
