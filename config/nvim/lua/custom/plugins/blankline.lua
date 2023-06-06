
return {
  "lukas-reineke/indent-blankline.nvim",
  version = "*",
  dependencies = {},
  config = function()
    vim.opt.list = true
    -- vim.opt.listchars:append "space:."
    -- vim.opt.listchars:append "eol:↴"
    require("indent_blankline").setup {
        filetype_exclude = {
            "help",
            "lazy",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "mason",
            "",
        },
        buftype_exclude = { "terminal" },
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    }
   end,
}
