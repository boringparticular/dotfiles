local lsp = require('lsp-zero').preset({
    name = 'recommended',
    set_lsp_keymaps = false,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.nvim_workspace()

lsp.ensure_installed({
    'tsserver',
    'pyright',
    'eslint',
    'rust_analyzer',
    'sumneko_lua',
    'svelte',
    'ansiblels',
})

lsp.format_on_save({
    servers = {
        ['lua_ls'] = {'lua'},
        ['rust_analyzer'] = {'rust'},
    }
})

lsp.format_mapping('gq', {
    servers = {
        ['lua_ls'] = {'lua'},
        ['rust_analyzer'] = {'rust'},
    }
})

lsp.setup()

lsp.setup_nvim_cmp({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'treesitter' },
        -- { name = 'cmdline', max_item_count = 5 },
        { name = 'path', max_item_count = 5 },
        { name = 'spell', max_itemcount = 5 },
    },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.reference() end, opts)
    vim.keymap.set('i', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<Leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)

    -- lsp.buffer_autoformat()
    -- vim.keymap.set({'n', 'x'}, 'gq', function() 
    --     vim.lsp.buf.format({async =false, timeout_ms = 10000})
    -- end)
end)

lsp.setup()

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)

        local format_cmd = function(input)
            vim.lsp.buf.format({
                id = client.id,
                timeout_ms = 5000,
                async = input.bang,
            })
        end

        local bufcmd = vim.api.nvim_buf_create_user_command
        bufcmd(bufnr, 'NullFormat', format_cmd, {
            bang = true,
            range = true,
            desc = 'Format using null-ls'
        })
    end,
    sources = {
        null_ls.builtins.diagnostics.yamllint,
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.eslint_d,
    },
})

require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = true,
  automatic_setup = true,
})

require('mason-null-ls').setup_handlers()
