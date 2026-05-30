return {
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      terminal_colors = true,
        gamma = 1,
      },
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require("tokyodark").setup(opts)
      vim.cmd.colorscheme("tokyodark")

      vim.opt.cursorline = true

      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

      vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7aa2f7", bold = true })

      vim.api.nvim_set_hl(0, "Visual", { bg = "#32303C" })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1a1a1a" })

      vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#a0a8cd", bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE" })

    end,
  },
}
