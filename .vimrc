set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'kien/ctrlp.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 0
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-show"']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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
set expandtab tabstop=2 shiftwidth=2 smartindent softtabstop=2 nu ru hlsearch t_Co=256
set list
colorscheme tomorrow-night

" Fold colors
hi Folded            ctermfg=180 ctermbg=236
hi FoldColumn        ctermfg=180 ctermbg=233

""""""""""""""""
"  javascript  "
""""""""""""""""

" wrap a line in a console log

function! MultiLineCommentFold()
  let text = getline(v:foldstart + 1)
  let text = substitute(text, '\(\s*\) \* \(.*\)', '\1\2', '')
  let ind = indent(v:foldstart)
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
