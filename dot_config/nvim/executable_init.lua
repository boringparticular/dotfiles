require('boring.remap')
require('boring.options')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    },
    'ThePrimeagen/harpoon',
    'stevearc/dressing.nvim',
    'mbbill/undotree',
    'rcarriga/nvim-notify',
    'tpope/vim-fugitive',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'beauwilliams/statusline.lua',
    'mattn/emmet-vim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'lewis6991/gitsigns.nvim',
    {
        'folke/trouble.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {},  -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = {      -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        },
        dependencies = { { "nvim-lua/plenary.nvim" } },
    },
    {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timoutlen = 300
            require('which-key').setup({

            })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        config = function(plug, opts)
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = {
                        'node_modules',
                        '.git',
                    }
                }
            })
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        init = function(plug, opts)
            local highlights = vim.api.nvim_create_augroup('custom_highlights', { clear = true })
            vim.api.nvim_create_autocmd('ColorScheme', {
                pattern = '*',
                group = highlights,
                callback = function()
                    vim.api.nvim_set_hl(0, 'IndentBlanklineIndent1', { fg = '#E06C75', nocombine = true })
                    vim.api.nvim_set_hl(0, 'IndentBlanklineIndent2', { fg = '#E5C07B', nocombine = true })
                    vim.api.nvim_set_hl(0, 'IndentBlanklineIndent3', { fg = '#98C379', nocombine = true })
                    vim.api.nvim_set_hl(0, 'IndentBlanklineIndent4', { fg = '#56B6C2', nocombine = true })
                    vim.api.nvim_set_hl(0, 'IndentBlanklineIndent5', { fg = '#61AFEF', nocombine = true })
                    vim.api.nvim_set_hl(0, 'IndentBlanklineIndent6', { fg = '#C678DD', nocombine = true })
                    vim.api.nvim_set_hl(0, 'IndentBlanklineIndent7', { bg = '#1F1F1F', nocombine = true })
                    vim.api.nvim_set_hl(0, 'IndentBlanklineIndent8', { bg = '#1A1A1A', nocombine = true })
                end
            })
        end,
        event = 'BufReadPre',
        opts = {
            show_current_context = true,
            use_treesitter = true,
            show_end_of_line = true,
            show_trailing_blankline_indent = false,
            space_char = '_',
            space_char_blankline = ' ',
            char_list = { '|', '¦', '┆', '┊' },
            char_highlight_list = {
                'IndentBlanklineIndent1',
                'IndentBlanklineIndent2',
                'IndentBlanklineIndent3',
                'IndentBlanklineIndent4',
                'IndentBlanklineIndent5',
                'IndentBlanklineIndent6',
            },
        },
    },
    -- {
    --     'rrethy/vim-hexokinase',
    --     build = 'make hexokinase'
    -- },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end
            },
            'williamboman/mason-lspconfig.nvim',

            'onsails/lspkind-nvim',
            'glepnir/lspsaga.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'jayp0521/mason-null-ls.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'ray-x/cmp-treesitter',
            'f3fora/cmp-spell',
            'saadparwaiz1/cmp_luasnip',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1,
        config = function()
            vim.cmd('colorscheme tokyonight')
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    },
    {
        'glepnir/lspsaga.nvim',
        opt = true,
        branch = 'main',
        event = 'LspAttach',
        config = function()
            require('lspsaga').setup({})
        end,
        requires = {
            { 'nvim-tree/nvim-web-devicons' },
            --Please make sure you install markdown and markdown_inline parser
            { 'nvim-treesitter/nvim-treesitter' }
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufReadPost',
        build = ':TSUpdate',
        config = function(plug, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
        opts = {
            ensure_installed = { 'css', 'html', 'lua', 'python', 'rust', 'svelte', 'toml', 'typescript', 'yaml' },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = 'gnn',
                    node_incremental = 'grn',
                    scope_incremental = 'grc',
                    node_decremental = 'grm',
                },
            },
            indent = {
                enable = true,
            },
            textobjects = {
                enable = true,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
        },
    },
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        config = function(plug, opts)
            require('flutter-tools').setup {}
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    },
    {
        'ellisonleao/glow.nvim',
        config = true,
        cmd = 'Glow'
    },
    {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    }
})

vim.api.nvim_create_autocmd('BufWritePre', { callback = vim.lsp.buf.format })
