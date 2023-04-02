vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>vwm', function()
    require('vim-with-me').StartVimWithMe()
end)
vim.keymap.set('n', '<leader>vwms', function()
    require('vim-with-me').StopVimWithMe()
end)

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format()
end)

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<leader>vpp', '<cmd>e ~/.dotfiles/nvim/.config/nvim/init.lua<CR>');
vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>');

vim.keymap.set('n', '<leader>cb', '<cmd>bp<CR><cmd>bd#<CR>', { desc = 'Close buffer and keep split' })

vim.keymap.set('n', '<leader>nf', '<cmd>NullFormat<CR>', { desc = 'Format using null-ls' })

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like 'open vsplit',
-- you can use <C-t> to jump back
vim.keymap.set('n', '<leader>gh', '<cmd>Lspsaga lsp_finder<CR>')

-- Code action
vim.keymap.set({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>')

-- Rename all occurrences of the hovered word for the entire file
vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<CR>')

-- Rename all occurrences of the hovered word for the selected files
vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename ++project<CR>')

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to 'definition_action_keys'
-- It also supports tagstack
-- Use <C-t> to jump back
vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>')

-- Go to definition
vim.keymap.set('n','gd', '<cmd>Lspsaga goto_definition<CR>')

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to 'definition_action_keys'
-- It also supports tagstack
-- Use <C-t> to jump back
vim.keymap.set('n', 'gt', '<cmd>Lspsaga peek_type_definition<CR>')

-- Go to type definition
vim.keymap.set('n','gt', '<cmd>Lspsaga goto_type_definition<CR>')


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
vim.keymap.set('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- Show buffer diagnostics
vim.keymap.set('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')

-- Show workspace diagnostics
vim.keymap.set('n', '<leader>sw', '<cmd>Lspsaga show_workspace_diagnostics<CR>')

-- Show cursor diagnostics
vim.keymap.set('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')

-- Diagnostic jump with filters such as only jumping to an error
vim.keymap.set('n', '[E', function()
  require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set('n', ']E', function()
  require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
vim.keymap.set('n','<leader>o', '<cmd>Lspsaga outline<CR>')

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ':Lspsaga hover_doc ++quiet'
-- Pressing the key twice will enter the hover window
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command '<C-w>w'
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc ++keep<CR>')

-- Call hierarchy
vim.keymap.set('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
vim.keymap.set('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')

-- Floating terminal
vim.keymap.set({'n', 't'}, '<A-d>', '<cmd>Lspsaga term_toggle<CR>')
