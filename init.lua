
-- VIM API Commands
vim.cmd([[
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set clipboard=unnamedplus
  filetype indent off
  filetype plugin off
  colorscheme habamax 
]])

vim.g.mapleader = " "


-- Lazy Package Manager
require("config.lazy")
-- Setup Lazy
require("lazy").setup("plugins")



vim.lsp.config['bash_ls'] = {
  cmd = { 'bash-language-server', 'start' },
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
    },
  },
  filetypes = { 'bash', 'sh' },
  root_markers = { '.git' },
}
vim.lsp.config['c_ls'] = {
  cmd = { 'ccls' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = { 'compile_commands.json', '.ccls', '.git' },
  offset_encoding = 'utf-32',
  -- ccls does not support sending a null root directory
  workspace_required = true,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspCclsSwitchSourceHeader', function()
      switch_source_header(client, bufnr)
    end, { desc = 'Switch between source/header' })
  end,
}
vim.lsp.config['cmake_ls'] = {
  cmd = { 'cmake-language-server' },
  filetypes = { 'cmake' },
  root_markers = { 'CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake' },
  init_options = {
    buildDirectory = 'build',
  },
}
vim.lsp.config['css_ls'] = {
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
vim.lsp.config['fortran_ls'] = {
  cmd = {'fortran-language-server'},
  filetypes = {'for'},
}
vim.lsp.config['go_ls'] = {
  cmd = {'gopls'},
  filetypes = {'go'},
}
vim.lsp.config['html_ls'] = {
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
vim.lsp.config['json_ls'] = {
 cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { '.git' },
}
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
  settings = {
    Lua = {
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
    },
  },
}
vim.lsp.config['python_ls'] = {
  cmd = {'python-lsp-server'},
  filetypes = {'py'},
}
vim.lsp.config['systemverilog_ls'] = {
  cmd = {'svls'},
  filetypes = {'sv'},
}
vim.lsp.config['tex_ls'] = {
  cmd = {'texlab'},
  filetypes = {'tex'},
}


vim.lsp.enable('bash_ls')
vim.lsp.enable('c_ls')
vim.lsp.enable('cmake_ls')
vim.lsp.enable('css_ls')
vim.lsp.enable('fortran_ls')
vim.lsp.enable('go_ls')
vim.lsp.enable('html_ls')
vim.lsp.enable('json_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('python_ls')
vim.lsp.enable('systemverilog_ls')
vim.lsp.enable('tex_ls')

