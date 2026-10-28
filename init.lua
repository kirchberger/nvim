local opt = vim.opt
local lsp = vim.lsp
-- VIM API Commands
vim.cmd([[
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set clipboard=unnamedplus
  filetype indent on
  filetype plugin on
  colorscheme habamax
]])
vim.cmd [[set completeopt+=menuone,noselect,popup]]
opt.number = true
opt.relativenumber = true
opt.scroll = 10
opt.scrolloff = 10
opt.cmdheight = 1
opt.completeopt = "fuzzy", "menuone"

vim.g.mapleader = " "


-- Lazy Package Manager
require("config.lazy")
-- Setup Lazy
require("lazy").setup("plugins")



lsp.config['bash_ls'] = {
	cmd = { 'bash-language-server', 'start' },
	settings = {
		bashIde = {
			globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
		},
	},
	filetypes = { 'bash', 'sh' },
	root_markers = { '.git' },
}
lsp.config['cmake_ls'] = {
	cmd = { 'cmake-language-server' },
	filetypes = { 'cmake' },
	root_markers = { 'CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake' },
	init_options = {
		buildDirectory = 'build',
	},
}
lsp.config['css_ls'] = {
	cmd = { 'vscode-css-language-server', '--stdio' },
	filetypes = { 'css', 'scss', 'less' },
	init_options = { provideFormatter = true },
	root_markers = { 'package.json', '.git' },
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
}
lsp.config['fortran_ls'] = {
	cmd = { 'fortran-language-server' },
	filetypes = { 'for' },
}
lsp.config['go_ls'] = {
	cmd = { 'gopls' },
	filetypes = { 'go' },
}
lsp.config['html_ls'] = {
	cmd = { 'vscode-html-language-server', '--stdio' },
	filetypes = { 'html', 'templ' },
	root_markers = { 'package.json', '.git' },
	settings = {},
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { 'html', 'css', 'javascript' },
	},
}
lsp.config['json_ls'] = {
	cmd = { 'vscode-json-language-server', '--stdio' },
	filetypes = { 'json', 'jsonc' },
	init_options = {
		provideFormatter = true,
	},
	root_markers = { '.git' },
}
lsp.config['python_ls'] = {
	cmd = { 'python-lsp-server' },
	filetypes = { 'py' },
}
lsp.config['systemverilog_ls'] = {
	cmd = { 'svls' },
	filetypes = { 'sv' },
}
lsp.config['tex_ls'] = {
	cmd = { 'texlab' },
	filetypes = { 'tex' },
}
lsp.config.rust_analyzer = {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	root_markers = { "Cargo.toml", ".git" },
	single_file_support = true,
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true,
			}
		}
	},
	before_init = function(init_params, config)
		-- See https://github.com/rust-lang/rust-analyzer/blob/eb5da56d839ae0a9e9f50774fa3eb78eb0964550/docs/dev/lsp-extensions.md?plain=1#L26
		if config.settings and config.settings['rust-analyzer'] then
			init_params.initializationOptions = config.settings['rust-analyzer']
		end
	end,
}
lsp.enable("rust_analyzer")
lsp.enable('c_ls')
lsp.enable('lua_ls')

lsp.enable('bash_ls')
lsp.enable('cmake_ls')
lsp.enable('css_ls')
lsp.enable('fortran_ls')
lsp.enable('go_ls')
lsp.enable('html_ls')
lsp.enable('json_ls')
lsp.enable('python_ls')
lsp.enable('systemverilog_ls')
lsp.enable('tex_ls')
