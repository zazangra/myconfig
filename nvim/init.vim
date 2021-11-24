set number
syntax on
set background=light
set tabstop=4
set softtabstop=4
set cursorline
set hidden
set wildmenu
set showcmd
set nobackup
set nowritebackup
set expandtab
set noerrorbells
set noswapfile
set backspace=indent,eol,start
set incsearch
set scrolloff=8
set nowrap
set sidescroll=5
set modifiable
set relativenumber
set encoding=utf-8
set updatetime=300
set shortmess+=c
set signcolumn=number

map! jj <Esc>
filetype plugin on
"set spell spelllang=en_us
set nocompatible              " required
filetype off     
call plug#begin('~/.vim/plugged')

"    Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'machakann/vim-sandwich'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'alvan/vim-closetag'
Plug 'preservim/nerdtree'
map <leader>n :NERDTreeToggle<CR>
Plug 'lervag/vimtex' 
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'


call plug#end()

let g:nord_contrast = 1
let g:nord_borders = 1
colorscheme nord 

"""replacing auto-clos plugin with vanilla vim
""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
""inoremap {;<CR> {<CR>};<ESC>O

"NERDTree
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

"""COC     
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')


"closetag enabled for:
let g:closetag_filenames = '*.xml, *.html, *.js, *.json, *.xhtml, *.phtml, *.ts, *.tsx,'

"language specific
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

au FileType,  BufRead *.tex
                        \set wrap linebreak
                        \ set spell

au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'})
au FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$', '$$':'$$'})

"templates
if has("autocmd")
        augroup templates
                autocmd BufNewFile *.sh 0r /home/alessandro/.vim/templates/skeleton.sh
                autocmd BufNewfile *.html 0r /home/alessandro/.vim/templates/skeleton.html 
                autocmd BufNewfile *.tex 0r /home/alessandro/.vim/templates/skeleton.tex
        augroup END
endif

"""Maps"""
noremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
imap <leader>s <ESC>:w<cr>a
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gs <cmd>Telescope grep_string<cr>
nnoremap <leader>w <cmd>Telescope current_buffer_fuzzy_find<cr>


"lua
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
        defaults = {
                prompt_prefix = ' > ',
                color_devicons = true,
                file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
                grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
                qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
                path_display = {
                        'shorten',
                        'absolute',
                        },
                mappings = {
                        i = {
                                ["<Esc>"] = actions.close,
                                },
                        },
                layout_config = {
                        preview_cutoff = 10,
                        preview_width = 50,
                        },
                },
        }
require'nvim-treesitter.configs'.setup {
        incremental_selection = {
        enable = false,
        keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
                },
        },
indent = {
enable = false
},
        highlight = {
        enable = true,
        },
}


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

nnoremap <silent> <leader>p :Format<CR>
