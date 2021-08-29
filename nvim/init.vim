set number
syntax on
set background=light
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
set incsearch
set scrolloff=8
set nowrap
set sidescroll=5
set modifiable
set relativenumber

map! jj <Esc>
filetype plugin on
"set spell spelllang=en_us
set nocompatible              " required
filetype off     
call plug#begin('~/.vim/plugged')

"    Plug 'w0rp/ale'
Plug 'mhartington/formatter.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'alvan/vim-closetag'
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


"closetag enabled for:
let g:closetag_filenames = '*.xml, *.html, *.js, *.json, *.xhtml, *.phtml '

"enabling compe 

set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.ultisnips = v:true

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

au FileType  BufRead *.tex
                        \set wrap linebreak
                        \ set spell
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'})
au FileType tex let b:AutoPairs = AutoPairsDefine({'$' : '$', '$$':'$$'})

"let b:ale_fixers = ['prettier', 'eslint']

if has("autocmd")
        augroup templates
                autocmd BufNewFile *.sh 0r /home/ale/.vim/templates/skeleton.sh
                autocmd BufNewfile *.html 0r /home/ale/.vim/templates/skeleton.html 
                autocmd BufNewfile *.tex 0r /home/ale/.vim/templates/skeleton.tex
        augroup END
endif

""trying out for wayland
"xnoremap "+y y:call system("wl-copy", @")<cr>
"nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
"nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>','','g')<cr>p

noremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
imap <leader>s <ESC>:w<cr>a
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fw <cmd>Telescope current_buffer_fuzzy_find<cr>

"autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
"autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

lua <<EOF

require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.sumneko_lua.setup{}


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
        }
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

require('formatter').setup({
  logging = false,
  filetype = {
        javascript  = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
        },
        html  = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
        },
        css  = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
        },
        python = {
                --pep8
                function()
                        return{
                        exe = "autopep8",
                        args = {'--in-place', '--aggressive', '--aggressive', vim.api.nvim_buf_get_name(0), },
                        stdin = false
                        }
                end
            },
         vim = {
                -- luafmt
                function()
                  return {
                    exe = "luafmt",
                    args = {"--indent-count", 2, "--stdin"},
                    stdin = false
                  }
                end
          },
        lua = {
                -- luafmt
                function()
                  return {
                    exe = "luafmt",
                    args = {"--indent-count", 2, "--stdin"},
                    stdin = false
                  }
                end
            }  
        }
        })

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js  FormatWrite
  autocmd BufWritePost *.lua  FormatWrite
  autocmd BufWritePost *.vim  FormatWrite
  autocmd BufWritePost *.css  FormatWrite
  autocmd BufWritePost *.php  FormatWrite
  autocmd BufWritePost *.py  FormatWrite
augroup END
]], true)
EOF

nnoremap <silent> <leader>p :Format<CR>

