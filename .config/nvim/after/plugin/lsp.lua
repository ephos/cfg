-- Need this to bridge the lsp and cmd
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.opt.completeopt = {'menuone', 'noselect', 'noselect'}

-- Who but WB Mason to install our LSPs?
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
-- Make sure that nvim LSP client can lazy load these suckers
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "powershell_es", "pyright", "gopls" },
}

-- Remapping some keys for CMP and making it look -~Fancy~-
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        --['Tab'] = cmp.mapping.confirm({ select = true}),
        ['<C-l>'] = cmp.mapping.confirm({ select = true }),
        ['CR'] = cmp.mapping.complete(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        }, {
            { name = 'nvim_lua' },
    }),
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = '',
                luasnip = '',
                buffer = '󰊄',
                path = '',
        }
        item.menu = menu_icon[entry.source.name]
        return item
        end,
    },
    window = {
        completion = {
            border = 'rounded',
        }
    }
}

-- Getting nice inline errors with Trouble to tell me how bad I am
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true })

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

require('lspconfig').gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}),
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}),
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}),
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}),
    vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, {buffer=0}),
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0}),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

require('lspconfig').terraformls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}),
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}),
    vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, {buffer=0}),
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0}),
    settings = {
        terraform = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

require('lspconfig').marksman.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}),
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}),
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}),
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}),
    vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, {buffer=0}),
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0}),
    settings = {
        marksman = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

-- local PSES_BUNDLE_PATH = vim.fn.expand("~/.local/share/nvim/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1")
-- local SESSION_TEMP_PATH = "/tmp/nvim_powershell_session"
-- Ensure the temporary directory exists
-- vim.fn.mkdir(SESSION_TEMP_PATH, "p")
require 'lspconfig'.powershell_es.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
--    cmd = { "pwsh", "-NoLogo", "-NoProfile", "-Command", PSES_BUNDLE_PATH .. " -BundledModulesPath " .. PSES_BUNDLE_PATH .. " -LogPath " .. SESSION_TEMP_PATH .. "/logs.log -SessionDetailsPath " .. SESSION_TEMP_PATH .. "/session.json -FeatureFlags @() -AdditionalModules @() -HostName 'My Client' -HostProfileId 'myclient' -HostVersion 1.0.0 -Stdio -LogLevel Normal" },
    filetypes = { "ps1", "psm1", "psd1" },
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}),
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}),
    vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, {buffer=0}),
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0}),
    settings = {
        powershell = {
            codeFormatting = {
                preset = 'OTBS',

                AddWhitespaceAroundPipe = true,
                AutoCorrectAliases = true,
                AvoidSemicolonsAsLineTerminators = true,
                UseConstantStrings = false,
                OpenBraceOnSameLine = true,
                NewLineAfterOpenBrace = true,
                NewLineAfterCloseBrace = false,
                TrimWhitespaceAroundPipe = true,
                WhitespaceBeforeOpenBrace = true,
                WhitespaceBeforeOpenParen = true,
                WhitespaceAroundOperator = true,
                --WhitespaceAfterSeparator = true,
                WhitespaceBetweenParameters = false,
                WhitespaceInsideBrace = false,
                IgnoreOneLineBlock = true,
                AlignPropertyValuePairs = true,
                UseCorrectCasing = true,
            },
            formatOnType = true,
        }
    }
}

--local PYRIGHT_PATH = vim.fn.expand("~/.local/share/nvim/mason/packages/pyright/node_modules/pyright/dist/pyright-langserver.js")
require 'lspconfig'.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
--    cmd = { "node", PYRIGHT_PATH, "--stdio" },
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}),
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}),
    vim.keymap.set("n", "gn", vim.diagnostic.goto_next, {buffer=0}),
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
                stubPath = vim.fn.expand("~/.cache/nvim/lspconfig/pyright-stubs")
            }
        }
    }
}

require 'lspconfig'.yamlls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        yaml = {
            keyOrdering = false,
            schemas = {
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
                ["https://raw.githubusercontent.com/projectatomic/registries/master/registries.schema.json"] = "registries.yml"
            }
        }
    }
}

require 'lspconfig'.lua_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', "on_attch", "flags" }
            }
        }
    }
}

require 'lspconfig'.gdscript.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "gd", "gdscript", "gdscript3" },
}

require 'lspconfig'.omnisharp.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    filetypes = { "cs", "csharp" },
}

local path_to_elixirls = vim.fn.expand("~/.cache/nvim/lspconfig/elixirls/elixir-ls/release/language_server.sh")
require 'lspconfig'.elixirls.setup {
    cmd = { path_to_elixirls },
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { path_to_elixirls },
    filetypes = { "elixir", "eelixir" },
    settings = {
        elixirLS = {
            dialyzerEnabled = false,
            fetchDeps = false
        }
    }
}
