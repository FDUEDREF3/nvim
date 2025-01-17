local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
require("keymap.helpers")

local plug_map = {
	-- Plugin: vim-fugitive
	["n|gps"] = map_cr("G push"):with_noremap():with_silent():with_desc("git: Push"),
	["n|gpl"] = map_cr("G pull"):with_noremap():with_silent():with_desc("git: Pull"),
	["n|<leader>G"] = map_cu("Git"):with_noremap():with_silent():with_desc("git: Open git-fugitive"),

	-- Plugin: nvim-tree
	["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("filetree: Toggle"),
	["n|<leader>nf"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent():with_desc("filetree: Find file"),
	["n|<leader>nr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent():with_desc("filetree: Refresh"),

	-- Plugin: sniprun
	["v|<leader>r"] = map_cr("SnipRun"):with_noremap():with_silent():with_desc("tool: Run code by range"),
	["n|<leader>r"] = map_cu([[%SnipRun]]):with_noremap():with_silent():with_desc("tool: Run code by file"),

	-- Plugin: toggleterm
	["t|<Esc><Esc>"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["t|jk"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	-- MY: toggle keymap adjustment
	["n|<A-h>"] = map_cr([[execute v:count . "ToggleTerm direction=horizontal"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle horizontal"),
	["i|<A-h>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle horizontal"),
	["t|<A-h>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle horizontal"),
	["n|<A-v>"] = map_cr([[execute v:count . "ToggleTerm direction=vertical"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["i|<A-v>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle vertical"),
	["t|<A-v>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
	-- ["n|<F5>"] = map_cr([[execute v:count . "ToggleTerm direction=vertical"]])
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("terminal: Toggle vertical"),
	-- ["i|<F5>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("terminal: Toggle vertical"),
	-- ["t|<F5>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
	["n|<A-i>"] = map_cr([[execute v:count . "ToggleTerm direction=float"]])
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["i|<A-i>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("terminal: Toggle float"),
	["t|<A-i>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
	["n|<leader>g"] = map_callback(function()
			_toggle_lazygit()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("git: Toggle lazygit"),

	-- Plugin: floaterm
	["n|<F6>"] = map_cmd("<Cmd>FloatermToggle<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("floaterm: Toggle float term"),
	["t|<F6>"] = map_cmd("<C-\\><C-n><Cmd>FloatermToggle<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("floaterm: Toggle float term"), --MY TODO
	["t|<F8>"] = map_cmd("<C-\\><C-n><Cmd>FloatermNew<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("floaterm: New float term"),
	["t|<F10>"] = map_cmd("<C-\\><C-n><Cmd>FloatermNext<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("floaterm: Go to next float term"),
	["t|<F9>"] = map_cmd("<C-\\><C-n><Cmd>FloatermPrev<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("floaterm: Go to previous float term"),
	-- tnoremap  <silent> <F12>  <C-\><C-n>:FloatermNext<CR>

	-- Plugin: trouble
	["n|<leader>tt"] = map_cr("TroubleToggle"):with_noremap():with_silent():with_desc("lsp: Toggle trouble list"),
	["n|<leader>gr"] = map_cr("TroubleToggle lsp_references")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show lsp references"),
	["n|<leader>td"] = map_cr("TroubleToggle document_diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show document diagnostics"),
	["n|<leader>tw"] = map_cr("TroubleToggle workspace_diagnostics")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show workspace diagnostics"),
	["n|<leader>tq"] = map_cr("TroubleToggle quickfix")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show quickfix list"),
	["n|<leader>tl"] = map_cr("TroubleToggle loclist"):with_noremap():with_silent():with_desc("lsp: Show loclist"),

	-- Plugin: telescope
	["n|<C-p>"] = map_callback(function()
			_command_panel()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("tool: Toggle command panel"),
	["n|<leader>u"] = map_callback(function()
			require("telescope").extensions.undo.undo()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("edit: Show undo history"),

	["n|<leader>fp"] = map_callback(function()
			require("telescope").extensions.projects.projects({})
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: Project"),
	["n|<leader>fr"] = map_callback(function()
			require("telescope").extensions.frecency.frecency()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: File by frecency"),
	["n|<leader>fw"] = map_callback(function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("find: Word in project"),
	["n|<leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent():with_desc("find: File by history"),
	["n|<leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent():with_desc("find: File in project"),
	["n|<leader>fc"] = map_cu("Telescope colorscheme")
		:with_noremap()
		:with_silent()
		:with_desc("ui: Change colorscheme for current session"),
	["n|<leader>fn"] = map_cu(":enew"):with_noremap():with_silent():with_desc("buffer: New"),
	["n|<leader>fg"] = map_cu("Telescope git_files")
		:with_noremap()
		:with_silent()
		:with_desc("find: file in git project"),
	["n|<leader>fz"] = map_cu("Telescope zoxide list")
		:with_noremap()
		:with_silent()
		:with_desc("edit: Change current direrctory by zoxide"),
	["n|<leader>fb"] = map_cu("Telescope buffers"):with_noremap():with_silent():with_desc("find: Buffer opened"),
	["n|<leader>fs"] = map_cu("Telescope grep_string"):with_noremap():with_silent():with_desc("find: Current word"),
	["n|<leader>fd"] = map_cu("Telescope file_browser")
		:with_noremap()
		:with_silent()
		:with_desc("find: open file browser"),
	["n|<leader>fm"] = map_cu("Telescope media_files"):with_noremap():with_silent():with_desc("find: open media files"),

	-- Plugin: dap  MY: change to vscode default shortcut
	["n|<F5>"] = map_callback(function()
			require("dap").continue()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run/Continue"),
	["n|<S-F5>"] = map_callback(function()
			require("dap").terminate()
			require("dapui").close()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Stop"),
	["n|<F8>"] = map_callback(function()
			require("dap").toggle_breakpoint()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Toggle breakpoint"),
	["n|<F11>"] = map_callback(function()
			require("dap").step_into()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step into"),
	["n|<S-F11>"] = map_callback(function()
			require("dap").step_out()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step out"),
	["n|<F10>"] = map_callback(function()
			require("dap").step_over()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Step over"),
	["n|<leader>db"] = map_callback(function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Set breakpoint with condition"),
	["n|<leader>dc"] = map_callback(function()
			require("dap").run_to_cursor()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run to cursor"),
	["n|<leader>dl"] = map_callback(function()
			require("dap").run_last()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Run last"),
	["n|<leader>do"] = map_callback(function()
			require("dap").repl.open()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Open REPL"),
	["n|<leader>dt"] = map_callback(function()
			-- require("dap").repl.open()
			require("dapui").toggle(2)
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Toggle REPL and console"),
	["n|<leader>da"] = map_callback(function()
			require("dapui").toggle()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("debug: Toggle all widgets"),

	-- Overseer task manager
	["n|<leader>ot"] = map_cmd("<Cmd>OverseerToggle<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("task: Toggle overseer task window"),

	["n|<leader>ow"] = map_callback(function()
			vim.cmd("OverseerToggle")
			vim.opt_local.wrap = true -- text wrap
		end)
		:with_noremap()
		:with_silent()
		:with_desc("task: Toggle overseer task window with wrap"),
	["n|<leader>or"] = map_cmd("<Cmd>OverseerRun<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("task: Run overseer task"),

	-- Code Runner
	["n|<leader>rc"] = map_callback(function()
			local cr = require("code_runner.commands")
			local cmds = cr.get_filetype_command()
			print("term cmd = ", cmds)
			-- cmds = '1TermExec cmd="' .. cmds .. '" direction=vertical'
			cmds = '1TermExec cmd="' .. cmds .. '"'
			vim.cmd(cmds)
		end)
		:with_noremap()
		:with_desc("code runner: Excute File"),

	["n|<leader>rp"] = map_callback(function()
			local cr = require("code_runner.commands")
			local cmds = cr.get_project_command()
			-- cmds = '1TermExec cmd="' .. cmds .. '" direction=vertical'
			cmds = '1TermExec cmd="' .. cmds .. '"'
			vim.cmd(cmds)
		end)
		:with_noremap()
		:with_desc("code runner: Excute Project"),
}

bind.nvim_load_mapping(plug_map)
