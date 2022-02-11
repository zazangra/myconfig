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
