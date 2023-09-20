local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff

  -- b.formatting.deno_fmt, -- Deno is fast but need prettier config for projects
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.black.with {
    filetypes = {
      "python",
    },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
