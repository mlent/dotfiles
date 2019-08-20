set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'AndrewRadev/splitjoin.vim'
" Use my fork for better formatting of haskell errors
" Plugin 'w0rp/ale'
Plugin 'mlent/ale'
Plugin 'honza/vim-snippets'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'ap/vim-css-color'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jxnblk/vim-mdx-js'

let mapleader = ";"
let g:airline_theme='onehalfdark'
let g:typescript_indent_disable = 1
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-Space>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}
let g:ale_linters ={
      \   'haskell': ['hlint', 'hdevtools', 'hfmt'],
      \  'javascript': ['eslint', 'flow'],
      \  'typescript': ['tslint'],
      \  'html': ['eslint']
      \}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--single-quote'

set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

syntax on
colorscheme onehalfdark
" set t_Co=256
set expandtab tabstop=2 shiftwidth=2 smartindent softtabstop=2
set nu ru hlsearch
set incsearch

scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set relativenumber 
set number

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
set colorcolumn=80

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <Leader>j :SplitjoinJoin<cr>
nnoremap <Leader>s :SplitjoinSplit<cr>
nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
nnoremap <Leader>d :TsuDefinition<cr>

" Commented out because go wants tabs :/
"set list
"set listchars=tab:▸\ ,eol:¬

" Fold colors
hi Folded            ctermfg=180 ctermbg=236
hi FoldColumn        ctermfg=180 ctermbg=233
hi! link ALEWarning  Search
" hi! link ALEInfo     Comment
" hi! link ALEError    WarningMsg

""""""""""""""""
"  javascript  "
""""""""""""""""

" wrap a line in a console log

function! MultiLineCommentFold()
    let text = WithoutPrefix(getline(v:foldstart + 1))
  " Adds the description of an ngdoc string if possible
  "if text =~ 'ngdoc'
    "let i = 2
    "let no_description = 1
    "while i < 7 && no_description
      "let line = getline(v:foldstart + i)
      "echom line
      "if line =~ '^\s*\* @description'
        "let no_description = 0
      "endif
      "let i += 1
    "endwhile
    "if !no_description
      "echom text
      "let text = text . ': ' . WithoutAll(getline(v:foldstart + i))
    "endif
  "endif

  let line_count = v:foldend-v:foldstart + 1
  let line_text = '('. line_count .' lines)    '
  let offset = strlen(line_text) + 4
  return text . repeat(' ', winwidth(0) - strlen(text) - offset) . line_text
endfunction

function! JsSettings()
  " folding of ngdoc comment strings
  set fmr=/**,*/ fdm=marker fdc=1
  set foldenable
  let &foldtext = "MultiLineCommentFold()"
endfunction

autocmd FileType javascript call JsSettings()
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<CR>
autocmd FileType typescript nmap <buffer> <leader>t :call tsuquyomi#hint()<CR>

augroup fmt
  autocmd!
  autocmd FileType BufWritePre * undojoin | Neoformat
augroup END

"""""""""""""""""""""""""
"  Whitespace deletion  "
"""""""""""""""""""""""""

" should be enabled for others too
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e
au BufWritePre *.py :%s/\s\+$//e
au BufWritePre *.jsx :%s/\s\+$//e
au BufWritePre *.tsx :%s/\s\+$//e
au BufWritePre *.ts :%s/\s\+$//e
au BufWritePre *.coffee :%s/\s\+$//e
au BufWritePre *.less :%s/\s\+$//e
au BufWritePre *.scss :%s/\s\+$//e
au BufWritePre *.java :%s/\s\+$//e

"""""""""""""""""""""
"  Typo Prevention  "
"""""""""""""""""""""

command! Q q
"
""""""""""""""""""""""""""""""""""""""
"  Try to stop using arrow keys...   " 
""""""""""""""""""""""""""""""""""""""

map   <Up>    :lprev<cr>
map   <Down>  :lnext<cr>
map   <Left>  :bprev<cr>
map   <Right> :bnext<cr>
imap  <Up>    <NOP>
imap  <Down>  <NOP>
imap  <Left>  <NOP>
imap  <Right> <NOP>
