-- onenord.nvim のカラーパレットを取得する
local colors = require('onenord.colors').load()

require('lualine').setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      {
        'filename',
        newfile_status = true,
        path = 1,
        shorting_target = 24,
        symbols = { modified = '_󰷥', readonly = ' ', newfile = '󰄛' },
      },
    },
    lualine_c = {},

    lualine_x = {
      'encoding',
    },
    lualine_y = {
      { 'filetype', color = { fg = colors.fg } },
    },

    lualine_z = {
      { 'fileformat', icons_enabled = true, separator = { left = '', right = '' } },
    },
  },
}
vim.api.nvim_set_option("showmode", false)
