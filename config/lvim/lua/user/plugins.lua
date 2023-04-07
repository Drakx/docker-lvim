lvim.plugins = {
   -- { "ray-x/go.nvim" },
   --  { "nvim-lua/plenary.nvim" },
  { "folke/tokyonight.nvim" },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
  	require("todo-comments").setup()
    end,
  },
}
