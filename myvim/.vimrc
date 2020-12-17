set number
syntax on
set background=dark
set tabstop=4
set autoindent
set softtabstop=4
set cursorline
set hidden
set wildmenu
set showcmd
set visualbell
set expandtab
set noerrorbells
set noswapfile
set backspace=indent,eol,start
filetype plugin on
"set spell spelllang=en_us


call plug#begin('~/.vim/plugged')
    
    Plug 'w0rp/ale'
"    Plug 'tpope/vim-surround'
    Plug 'tmsvg/pear-tree'
   augroup tex_pairs 
            autocmd!
            autocmd FileType tex let b:pear_tree_pairs = {
    \ '$': {'closer': '$'},
    \ '[': {'closer': ']'},
    \ '(': {'closer': ')'},
    \ '{': {'closer': '}'},
    \ '"': {'closer': '"'},      
    \ }
    augroup END
    Plug 'vim-scripts/loremipsum'
"    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    Plug 'junegunn/fzf' , { 'do': { -> fzf#install()} }
    Plug 'alvan/vim-closetag'
    Plug 'scrooloose/nerdtree'
    map <C-n> :NERDTreeToggle<CR>
    Plug 'lervag/vimtex' 
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    Plug 'sirver/ultisnips'

      let g:UltiSnipsExpandTrigger="<tab>"
      let g:UltiSnipsJumpForwardTrigger="<c-b>"
      let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    Plug 'honza/vim-snippets'

   if has('nvim')
        Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  else 
          Plug 'Shougo/deoplete.nvim'
          Plug 'roxma/nvim-yarp'
          Plug 'roxma/vim-hug-neovim-rpc'
  endif
    let g:deoplete#enable_at_startup = 1


    Plug 'vim-airline/vim-airline'


 call plug#end()

let g:nord_bold_vertical_split_line = 1
colorscheme nord 
"set termguicolors
if (has("termguicolors"))
  set termguicolors
endif

"closetag enabled for:
let g:closetag_filenames = '*.xml, *.html, *.js, *.json, *.xhtml, *.phtml '

if has("autocmd")
        augroup templates
        autocmd BufNewFile *.sh 0r /home/ale/.vim/templates/skeleton.sh
        autocmd BufNewfile *.html 0r /home/ale/.vim/templates/skeleton.html 
        autocmd BufNewFile *.js 0r /home/ale/.vim/templates/skeleton.js
        autocmd BufNewfile *.tex 0r /home/ale/.vim/templates/skeleton.tex
augroup END
endif
    
