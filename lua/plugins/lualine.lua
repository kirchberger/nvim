return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'codedark',
      },
      tabline = {
        lualine_a = {'filename'},
        lualine_b = {'tabs'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'filesize'},
        lualine_z = {'filename'},
      },
    })
  end
}
