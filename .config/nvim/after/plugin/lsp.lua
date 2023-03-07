local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'powershell_es',
    --'sumneko_lua',
    'gopls',
    'tflint',

})

-- Remapping some keys for CMP and making it look -~Fancy~-
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['Tab'] = cmp.mapping.confirm({ select = true}),
    ['CR'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

cmp.setup {
    window = {
        completion = {
            border = 'rounded',
        }
    }
}

-- Getting nice inline errors with Trouble to tell me how bad I am
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true })

-- Fix that pesky "Undefined global `vim`" error for sumneko_lua
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()
