return {
  "ziglang/zig.vim",
  version = "*",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/completion-nvim",
  },
  config = function()
    local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        require('completion').on_attach()
    end
    require("zls").setup {
      on_attach = on_attach,
    },
    -- Set completeopt to have a better completion experience
    set completeopt=menuone,noinsert,noselect,
    -- Enable completions as you type
    let g:completion_enable_auto_popup = 1,
  end,
}
