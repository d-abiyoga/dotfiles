vim.cmd[[
  if has('termguicolors')
  set termguicolors
  endif

  " For dark version.
  set background=dark
      
  " Set contrast.
  " Available values: 'hard', 'medium'(default), 'soft'
  let g:gruvbox_material_background = 'medium'
      colorscheme gruvbox-material
]]
