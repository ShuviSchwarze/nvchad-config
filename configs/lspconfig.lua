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

lspconfig["html"].setup {
  filetypes = { "html", "htmldjango" },
}

lspconfig["tailwindcss"].setup {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "htmldjango", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  root_dir = require("lspconfig/util").root_pattern(
    "tailwind.config.js",
    "tailwind.config.ts",
    "tailwind.config.lua",
    ".tailwind",
    "package.json"
  ),
}

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   silent = true,
-- })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.handlers.hover, {
--   border = "rounded",
-- })

-- lspconfig.pyright.setup { blabla}
