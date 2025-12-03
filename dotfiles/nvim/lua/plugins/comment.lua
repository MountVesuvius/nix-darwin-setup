return {
  'numToStr/Comment.nvim',
  event={'VeryLazy'},
  config = function()
    require('Comment').setup()

    -- For commenting a line in normal mode
    vim.keymap.set("n", "<leader>cl", function()
      require("Comment.api").toggle.linewise.current()
    end, { noremap = true, silent = true })

    -- For commenting a visual selection
    vim.keymap.set("v", "<leader>cl", function()
      local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
      vim.api.nvim_feedkeys(esc, 'nx', false)
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { noremap = true, silent = true })
  end
}
