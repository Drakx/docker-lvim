return {
    "ziglang/zig.vim",
    version = "*",
    dependencies = {"neovim/nvim-lspconfig", "nvim-lua/completion-nvim"},
    config = function()
        local lspconfig = require("lspconfig")
        local on_attach = function(_, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc',
                                        'v:lua.vim.lsp.omnifunc')
            require('completion').on_attach()
        end
        -- Set completeopt to have a better completion experience
        vim.o.completeopt = "menuone,noinsert,noselect"

        -- Enable completions as you type
        vim.g.completion_enable_auto_popup = 1

        local servers = {'zls'}
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup {on_attach = on_attach}
        end
    end
}

