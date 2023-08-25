---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-p>"] = { ":Telescope find_files <CR>", "Find files", opts = { nowait = true } },
    ["<A-]>"] = { ":cnext <CR>", "Next Quickfix" },
    ["<A-[>"] = { ":cprev <CR>", "Prev Quickfix" },
    ["<C-x>"] = { ":bd<CR>", "Unload buffer" },
    ["<C-X>"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close All Buffers",
    },
  },
}

M.move_lines = {
  n = {
    ["<A-j>"] = { ":m+ <CR> ==", "Move Line Down" },
    ["<A-k>"] = { ":m-2 <CR> ==", "Move Line Up" },
    ["<A-Down>"] = { ":m+ <CR> ==", "Move Line Down" },
    ["<A-Up>"] = { ":m-2 <CR> ==", "Move Line Up" },
    ["<A-J>"] = { "yyp", "Clone Line Down" },
    ["<A-K>"] = { "yykp", "Clone Line Up" },
    ["<A-Left>"] = { "yyp", "Clone Line Down" },
    ["<A-Right>"] = { "yykp", "Clone Line Up" },
  },
  i = {
    ["<A-k>"] = { "<esc> :m-2 <CR> ==hi", "Move Line Up" },
    ["<A-j>"] = { "<esc> :m+ <CR> ==hi", "Move Line Down" },
    ["<A-Down>"] = { "<esc> :m+ <CR> ==hi", "Move Line Down" },
    ["<A-Up>"] = { "<esc> :m-2 <CR> ==hi", "Move Line Up" },
  },
  x = {
    ["<A-j>"] = { ":m '>+1 <CR> gv=gv", "Move Line Down" },
    ["<A-k>"] = { ":m '<-2 <CR> gv=gv", "Move Line Up" },
    ["<A-Up>"] = { ":m '<-2 <CR> gv=gv", "Move Line Down" },
    ["<A-Down>"] = { ":m '>+1 <CR> gv=gv", "Move Line Up" },
  },
}

M.harpoon = {
  n = {
    ["<leader>he"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Open Menu",
    },
    ["<leader>hm"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Mark file",
    },
    ["<leader>hx"] = {
      function()
        require("harpoon.mark").rm_file()
      end,
      "Unmark current buffer",
    },
    ["<leader>hX"] = {
      function()
        require("harpoon.mark").clear_all()
      end,
      "Unmark all buffers",
    },
    ["<leader>h]"] = {
      function()
        require("harpoon.ui").nax_next()
      end,
      "Goto next mark",
    },
    ["<leader>h["] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Goto prev mark",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fH"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fh"] = { ":Telescope harpoon marks <CR>", "Find harpoon marks" },
  },
}

--nvterm should use toggled terms only
M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>v"] = "",
  },
}

-- more keybinds!

return M
