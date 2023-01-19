" For color sheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark

let g:gruvbox_material_palette="original"
let g:gruvbox_material_background = "hard"
colorscheme gruvbox-material

hi SpellBad cterm=underline
