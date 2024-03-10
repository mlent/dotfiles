set nocompatible              " be iMproved, required
filetype off                  " required

" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
"------------------------ COC ------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'ianks/vim-tsx'
Plug 'Quramy/tsuquyomi'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'github/copilot.vim'

call plug#end()
" == VIMPLUG END ================================
" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
let mapleader = ";"
let g:airline_theme='wombat'
let g:typescript_indent_disable = 1
let g:tsuquyomi_completion_detail = 1
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-Space>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = [$HOME.'/.vim/UltiSnips']

let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" All of your Plugins must be added before the following line
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
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

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
