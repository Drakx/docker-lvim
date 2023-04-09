local options = {
	-- Relative line numbers
	relativenumber = true,
	-- Undotree default location
	undodir = os.getenv("HOME") .. "/.config/nvim/undodir",
	cursorline = true,
	-- hlsearch = true,                      -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

require('telescope').load_extension("projects")
