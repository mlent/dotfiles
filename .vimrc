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
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_theme='deus'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<CTRL-j>"
let g:UltiSnipsJumpForwardTrigger="<CTRL-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-CTRL-j>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

let g:airline#extensions#ale#enabled = 1
let g:ale_linters ={
      \   'haskell': ['stack-ghc', 'ghc-mod', 'hlint', 'hdevtools', 'hfmt'],
      \}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" t_Co=256

syntax on
set background=dark
set expandtab tabstop=2 shiftwidth=2 smartindent softtabstop=2
set nu ru hlsearch
set incsearch
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set relativenumber 
set number

" t_Co=256
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
" :match ErrorMsg '\%>80v.\+'
set colorcolumn=80

nnoremap ,j :SplitjoinJoin<cr>
nnoremap ,s :SplitjoinSplit<cr>

" Commented out because go wants tabs :/
"set list
"set listchars=tab:▸\ ,eol:¬

" Fold colors
hi Folded            ctermfg=180 ctermbg=236
hi FoldColumn        ctermfg=180 ctermbg=233

nnoremap ,j :SplitjoinJoin<cr>
nnoremap ,s :SplitjoinSplit<cr>

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

"""""""""""""""""""""""""
"  Whitespace deletion  "
"""""""""""""""""""""""""

" should be enabled for others too
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e
au BufWritePre *.py :%s/\s\+$//e
au BufWritePre *.jsx :%s/\s\+$//e
au BufWritePre *.coffee :%s/\s\+$//e
au BufWritePre *.less :%s/\s\+$//e
au BufWritePre *.scss :%s/\s\+$//e
au BufWritePre *.java :%s/\s\+$//e

"""""""""""""""""""""
"  Typo Prevention  "
"""""""""""""""""""""

command! Q q
