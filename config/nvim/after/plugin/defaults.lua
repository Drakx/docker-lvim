local options = {
	relativenumber = true,                               -- Relative line numbers
	undodir = os.getenv("HOME") .. "/.config/nvim/undodir", -- Undotree default location
	cursorline = true,                                   -- Hightlight current line cursor is on
	-- hlsearch = true,                                     -- Highlight all matches on previous search pattern
	ignorecase = true,                                   -- Ignore case in search patterns
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- require('telescope').load_extension("projects")
