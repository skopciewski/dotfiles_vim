" For vimwiki
let g:vimwiki_main_wiki_path = $VIMWIKI_MAIN_WIKI_PATH
let g:vimwiki_default_wiki_path = "~/vimwiki"
let g:vimwiki_list = [{'path': empty(vimwiki_main_wiki_path) ? vimwiki_default_wiki_path : vimwiki_main_wiki_path,
                      \ 'path_html': (empty(vimwiki_main_wiki_path) ? vimwiki_default_wiki_path : vimwiki_main_wiki_path) . '/html_site/'}]
let g:vimwiki_global_ext = 0

