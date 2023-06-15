local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true,   -- bindings for folds, spelling and others prefixed with z
			g = true,   -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },                                        -- min and max height of the columns
		width = { min = 20, max = 50 },                                        -- min and max width of the columns
		spacing = 3,                                                           -- spacing between columns
		align = "left",                                                        -- align columns left, center or right
	},
	ignore_missing = true,                                                     -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true,                                                          -- show help message on the command line when the popup is visible
	triggers = "auto",                                                         -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n",  -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "[A]lpha" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"[B]uffers",
	},
	["c"] = { "<cmd>bdelete!<cr>", "[C]lose Buffer" },
	["d"] = {
		name = "[D]ebug", b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "[D]ebug [B]reakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "[D]ebug [C]ontinue" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "[D]ebug [L]ast" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "[D]ebug [R]epl" },
		s = {
			name = "Step",
			i = { "<cmd>lua require'dap'.step_into()<cr>", "[S]tep [I]nto" },
			o = { "<cmd>lua require'dap'.step_over()<cr>", "[S]tep [O]ver" },
			O = { "<cmd>lua require'dap'.step_out()<cr>", "[S]tep [O]ut" },
		},
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "[D]ebug [U]I" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "[D]ebug [E]xit" },
	},
	["e"] = { "<cmd>Neotree toggle<cr>", "[E]xplorer" },
	-- ["f"] = {
	-- 	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	-- 	"Find files",
	-- },
	-- ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["g"] = {
		name = "[G]it",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>Git<cr>", "Git status" },
		S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},
	["l"] = {
		name = "[L]SP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code [A]ction" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document [D]iagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format()<cr>", "[F]ormat" },
		g = {
			name = "Go",
			a = { "<cmd>GoAlt<cr>", "alternate impl and test" },
			b = { "<cmd>GoBuild<cr>", "go build" },
			c = {
				name = "Coverage",
				c = { "<cmd>GoCoverage<cr>", "annotate with coverage" },
				t = { "<cmd>GoCoverageToggle<cr>", "toggle coverage display" },
				C = { "<cmd>GoCoverageClear<cr>", "clear coverage" },
				b = { "<cmd>GoCoverageBrowser<cr>", "open coverage in a browser" },
			},
			d = { "<cmd>GoDoc<cr>", "[G]o [D]oc" },
			i = { "<cmd>GoInstallDeps<cr>", "[G]o [I]nstall [D]eps" },
			m = {
				name = "Module",
				i = { "<cmd>GoModInit<cr>", "[Go] [M]od [I]nit" },
				t = { "<cmd>GoModTidy<cr>", "[Go] [M]od [T]idy" },
			},
			r = { "<cmd>GoRun<cr>", "go run" },
			t = {
				name = "Test",
				a = { "<cmd>GoTest ./...<cr>", "go test ./..." },
				f = { "<cmd>GoTestFunc<cr>", "go test -s [current test]" },
				d = {
					"<cmd>call vimspector#LaunchWithSettings( #{ configuration: 'single test', TestName: go#util#TestName() } )<cr>",
					"Debug current test",
				},
				-- x = { "<cmd>GoTermClose<cr>", "[C]lose Test Term" },
				x = { require('go.term').close(), "[C]lose Test Term" },
			},
		},
		i = { "<cmd>LspInfo<cr>", "[I]nfo" },
		I = { "<cmd>LspInstallInfo<cr>", "[I]nstaller Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
			"[N]ext Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"[P]rev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"[W]orkspace Diagnostics",
		},
	},
	["s"] = {
		name = "[S]earch",
		b = { "<cmd>Telescope git_branches<cr>", "[S]earch git [b]ranches" },
		c = { "<cmd>Telescope colorscheme<cr>", "[S]earch [c]olorscheme" },
		d = { "<cmd>Telescope diagnostics<cr>", "[S]earch [d]iagnostics" },
		f = { "<cmd>Telescope find_files<cr>", "[S]earch [f]iles" },
		g = { "<cmd>Telescope live_grep<cr>", "[S]earch by [g]rep" },
		h = { "<cmd>Telescope help_tags<cr>", "[S]earch [h]elp" },
		k = { "<cmd>Telescope keymaps<cr>", "[S]earch [k]eymaps" },
		r = { "<cmd>Telescope oldfiles<cr>", "[S]earch [r]ecently opened files" },
		w = { "<cmd>Telescope grep_string<cr>", "[S]earch current [w]ord" },
		C = { "<cmd>Telescope commands<cr>", "[S]earch [C]ommands" },
		M = { "<cmd>Telescope man_pages<cr>", "[S]earch [M]an Pages" },
		R = { "<cmd>Telescope registers<cr>", "[S]earch [R]egisters" },
	},
	["t"] = {
		name = "[T]erminal",
		-- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
        ["T"] = {
		name = "[T]rouble",
		t = { "<cmd>Trouble<cr>", "[T]rouble" },
		r = { "<cmd>TroubleRefresh<cr>", "[T]rouble [R]efresh" },
	},
	["w"] = { "<cmd>w!<cr>", "[W]rite" },
	["q"] = { "<cmd>q!<cr>", "[Q]uit" },
	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "[P]rojects" },
	["L"] = {
		name = '[L]azy',
		i = { "<cmd>Lazy install<cr>", "[L]azy [I]nstall" },
		u = { "<cmd>Lazy update<cr>", "[L]azy [U]pdate" },
		s = { "<cmd>Lazy sync<cr>", "[L]azy [S]ync" },
		h = { "<cmd>Lazy home<cr>", "[L]azy [H]ome" }
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
