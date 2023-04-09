local options = {
	foldenable = true,   -- Folds
	foldmethod = "syntax",
	wrap = false,        -- Wrap text
	expandtab = false,
	swapfile = false,    -- Creates a swapfile
	fileencoding = 'utf-8', -- File encoding
	shiftwidth = 4,      -- Default indent
	tabstop = 4,
	splitbelow = true,   -- Splits
	splitright = true,
	termguicolors = true, -- Term colours
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
