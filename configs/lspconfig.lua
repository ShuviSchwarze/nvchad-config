local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- local typescript_tools = require "typescript-tools"

-- if you just want default config for the servers then put them in a table
local servers = {
  -- "html",
  "cssls",
  -- "tsserver",
  "tsserver",

  -- "clangd",
  "bufls",
  "pyright",
  "tailwindcss",
  "emmet_ls",
  "eslint",
  -- "quick_lint_js",
  "dockerls",
  "docker_compose_language_service",
  "prismals",

  "rust_analyzer",
  "gleam",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- inherit my volar settings, you can just add vue to the `typescript-tools` filetypes.
  }
end

-- If tsserver broke again, and I swear to god it will, bump nvm node version

local vue_typescript_plugin = require("mason-registry").get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"
  .. "/node_modules/@vue/typescript-plugin"

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  single_file_support = true,

  init_options = {
    hostInfo = "neovim",
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_typescript_plugin,
        languages = {
          "javascript",
          "typescript",
          "vue",
        },
      },
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
}

-- lspconfig.quick_lint_js.setup {
--   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
-- }

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   silent = true,
-- })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.handlers.hover, {
--   border = "rounded",
-- })

-- lspconfig.pyright.setup { blabla}
