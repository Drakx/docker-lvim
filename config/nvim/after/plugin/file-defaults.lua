local options = {
	foldenable = true,
	foldmethod = "syntax", -- Folds
	wrap = false,
	expandtab = false,
	swapfile = false, -- creates a swapfile
	fileencoding = 'utf-8',
	-- Set default indent
	shiftwidth = 4,
	tabstop = 4,
	-- splits
	splitbelow = true,
	splitright = true,
	termguicolors = true,
}

if vim.bo.filetype == 'python' then
	vim.opt.shiftwidth = 4
	vim.opt.tabstop = 4
	vim.opt.expandtab = true
end

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[set iskeyword+=-]])
