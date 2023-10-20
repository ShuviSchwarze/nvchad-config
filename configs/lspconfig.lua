local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  -- "clangd",
  "bufls",
  "pyright",
  "tailwindcss",
  "emmet_ls",
  "eslint",
  "dockerls",
  "docker_compose_language_service",
  "prismals",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- If tsserver broke again, and I swear to god it will, bump nvm node version
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  single_file_support = true,
}

lspconfig.html.setup {
  filetypes = { "html", "htmldjango" },
}

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   silent = true,
-- })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.handlers.hover, {
--   border = "rounded",
-- })

-- lspconfig.pyright.setup { blabla}
