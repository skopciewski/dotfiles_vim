" For color sheme
colorscheme molokai
let g:solarized_termcolors=256

" For Airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

" for nerdtree
let NERDTreeWinPos = 'right'
nnoremap <C-g> :NERDTreeToggle<cr>

" for ctrlp
let g:ctrlp_map = '<Leader>.'
let g:ctrlp_switch_buffer = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" for ACK
nnoremap <Leader>g :Ack
