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
set expandtab
set noerrorbells
set noswapfile
set backspace=indent,eol,start
map! jj <Esc>
filetype plugin on
"set spell spelllang=en_us
set nocompatible              " required
filetype off     

call plug#begin('~/.vim/plugged')
    
    Plug 'w0rp/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'machakann/vim-sandwich'
    Plug 'vim-scripts/loremipsum'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"    Plug 'morhetz/gruvbox
    Plug 'shaunsingh/nord.nvim'
"    Plug 'arcticicestudio/nord-vim'
    Plug 'junegunn/fzf' , { 'do': { -> fzf#install()} }
    Plug 'alvan/vim-closetag'
    Plug 'preservim/nerdtree'
"    Plug 'scrooloose/nerdtree'
    map <C-n> :NERDTreeToggle<CR>
    Plug 'lervag/vimtex' 
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    Plug 'sirver/ultisnips'

      let g:UltiSnipsExpandTrigger="<tab>"
      let g:UltiSnipsJumpForwardTrigger="<c-b>"
      let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    Plug 'ryanoasis/vim-devicons'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'honza/vim-snippets'


 call plug#end()

let g:nord_contrast = 1
let g:nord_borders = 1
colorscheme nord 

"set termguicolors
"if (has("termguicolors"))
"  set termguicolors
"endif

"closetag enabled for:
let g:closetag_filenames = '*.xml, *.html, *.js, *.json, *.xhtml, *.phtml '

au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile, BufRead *.js, *.html, *.css 
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'})
au FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$', '$$':'$$'})

if has("autocmd")
        augroup templates
        autocmd BufNewFile *.sh 0r /home/alessandro/.vim/templates/skeleton.sh
        autocmd BufNewfile *.html 0r /home/alessandro/.vim/templates/skeleton.html 
        autocmd BufNewfile *.tex 0r /home/alessandro/.vim/templates/skeleton.tex
augroup END
endif
    
"trying out for wayland
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>','','g')<cr>p

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

lua <<EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF
