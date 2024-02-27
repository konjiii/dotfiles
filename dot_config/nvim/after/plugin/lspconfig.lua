-- setup language servers.
local lspconfig = require('lspconfig')
-- configure pyright
lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                PythonPlatform = "Windows",
                -- typeCheckingMode = "off",
                -- reportGeneralTypeIssues = "none",
                strictListInference = true,
                strictDictionaryInference = true,
                strictSetInference = true,
            },
        },
    },
}
