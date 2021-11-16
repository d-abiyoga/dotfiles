--  Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',

  rosepine = {
    base = '#232136',
    surface = '#2a273f',
    overlay = '#393552',
    inactive = '#59546d',
    subtle = '#817c9c',
    text = '#e0def4',
    love = '#eb6f92',
    gold = '#f6c177',
    rose = '#ea9a97',
    pine = '#3e8fb0',
    foam = '#9ccfd8',
    iris = '#c4a7e7',
  }
}

--[[local colors-rosepine = {
  base = '#232136',
  surface = '#2a273f',
  overlay = '#393552',
  inactive = '#59546d',
  subtle = '#817c9c',
  text = '#e0def4',
  love = '#eb6f92',
  gold = '#f6c177',
  rose = '#ea9a97',
  pine = '#e8fb0',
  foam = '#9ccfd8',
  iris = '#c4a7e7',
}
--]]

local my_theme = {
  normal = {
    a = { fg = colors.rosepine.base, bg = colors.rosepine.rose },
    b = { fg = colors.rosepine.text, bg = colors.rosepine.overlay },
    c = { fg = colors.rosepine.text, bg = colors.rosepine.surface },
  },

  insert = { a = { fg = colors.rosepine.text, bg = colors.rosepine.pine } },
  visual = { a = { fg = colors.rosepine.base, bg = colors.rosepine.love } },
  replace = { a = { fg = colors.rosepine.base, bg = colors.rosepine.iris } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}


require('lualine').setup {
  options = {
    theme = my_theme,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
     lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype'},
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = { 'nvim-tree'},
}
