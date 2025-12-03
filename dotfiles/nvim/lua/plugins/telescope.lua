return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for async operations
    "nvim-tree/nvim-web-devicons", -- Icons for UI
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make", -- FZF native is compiled for better speed
    },
  },
  opts = {
    defaults = {
      border = true,
      file_ignore_patterns = { "node_modules", ".git" }, -- Ignore clutter
      mappings = {
        i = {
          ["<C-u>"] = false, -- Remove preview scrolling up
          ["<C-d>"] = false, -- Remove preview scrolling down
        },
        n = {},
      },
    },
    pickers = {
      find_files = { hidden = true },
      live_grep = { only_sort_text = true },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- add the mapping now that actions is available
    opts.defaults.mappings.n["<esc><esc>"] = actions.close

    telescope.setup(opts)

    -- Load fzf extension
    pcall(telescope.load_extension, "fzf")

    -- Keybindings for Telescope
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find Help" })
  end,
}
