return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require("nvim-treesitter")-- May have issue with enabling
    config.install = {"c", "lua", "tex", "python", "bash"}
  end
}

