require "user.lsp.langs.go"
require "user.lsp.langs.python"
require "user.lsp.langs.sh"

lvim.lsp.diagnostics.virtual_text = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "go",
  "json",
  "lua",
  "python",
  "yaml",
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
	"bashls",
	"gopls",
	"lua_ls",
	"pyright",
	"yamlls",
    "jsonls",
    "sumneko_lua",
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "google_java_format", filetypes = { "java" } },
  { command = "stylua", filetypes = { "lua" } },
  { command = "shfmt", filetypes = { "sh", "zsh" } },
  { command = "prettier", filetypes = { "css" } },
}
