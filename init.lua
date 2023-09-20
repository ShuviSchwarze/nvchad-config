-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimResized", {
  pattern = "*",
  command = "silent! tabdo wincmd =",
})

autocmd("TextYankPost", {
  pattern = "*",
  command = "silent! lua vim.highlight.on_yank()",
})
