" Autocomplete
let g:ycm_semantic_triggers = {
         \ 'haskell' : ['.', ' '],
         \ 'elm' : ['.', ' '],
         \}
autocmd! FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd BufWritePost *.hs exec "normal _ct"

" Shortcuts
map <leader>t :GhcModType<CR>
map <leader>i :call HaskellSearchEngine('hoogle')<CR>
map <leader>nt :GhcModTypeClear<CR>
map <leader>gb :GhcModSigCodegen<CR>
map <leader>gt :GhcModTypeInsert<CR>
map <leader>gc :GhcModSplitFunCase<CR>
map <leader><Space> :Tmux :load <C-r>%<CR>

" Auto lint on save
let g:syntastic_haskell_checkers = ['hlint', 'hdevtools']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

set tags=tags;/,codex.tags;/

" Generate haskell tags with codex and hscope
map <leader>ht :!codex update --force<CR>:call system("git-hscope -X TemplateHaskell")<CR><CR>:call LoadHscope()<CR>

set csprg=hscope
set csto=1 " search codex tags first
set cst
set csverb
nnoremap <silent> <C-S-F> :cs find c <C-R>=expand("<cword>")<CR><CR>
" Automatically make cscope connections
function! LoadHscope()
  let db = findfile("hscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/hscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /*.hs call LoadHscope()

function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>r. :call Pointfree()<CR>

function! Pointful()
  call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>r> :call Pointful()<CR>
