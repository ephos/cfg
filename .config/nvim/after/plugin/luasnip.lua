-- Don't forget Pwsh
-- Invoke-WebRequest -Uri https://raw.githubusercontent.com/PowerShell/vscode-powershell/master/snippets/PowerShell.json -OutFile ~/.config/nvim/snippets/powershell.json
-- If you do this vscode style snippets REQUIRE the package.json
require("luasnip.loaders.from_vscode").load({
    paths = {
        vim.fn.stdpath('config') .. '/snippets',
        --"/home/ephos/.config/nvim/snippets/"
    }
})
--require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip").snippets = {}
