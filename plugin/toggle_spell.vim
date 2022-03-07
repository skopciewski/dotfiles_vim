" Spell Check

" Enable spell-check on specific files.
autocmd filetype html,markdown,gitcommit setlocal spell

" Set local myLang var
autocmd BufEnter * if !exists( "b:myLang" ) |
      \ if &spell |
        \ let b:myLang=index(g:myLangList, &spelllang) |
      \ else |
        \ let b:myLang=0 |
      \ endif |
  \ endif

let g:myLangList=["nospell","en","pl"]

function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap =ss :call ToggleSpell()<CR>
