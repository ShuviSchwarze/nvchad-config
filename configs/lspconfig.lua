local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- local typescript_tools = require "typescript-tools"

-- if you just want default config for the servers then put them in a table
local servers = {
  -- "html",
  "cssls",
  -- "tsserver",
  "volar",

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
  handlers = {
    ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
      if result.diagnostics == nil then
        return
      end

      -- ignore some tsserver diagnostics
      local idx = 1
      while idx <= #result.diagnostics do
        local entry = result.diagnostics[idx]

        local formatter = require("format-ts-errors")[entry.code]
        entry.message = formatter and formatter(entry.message) or entry.message

        -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
        if entry.code == 80001 then
          -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
          table.remove(result.diagnostics, idx)
        else
          idx = idx + 1
        end
      end

      vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end,
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
