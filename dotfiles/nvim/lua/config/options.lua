local opt = vim.opt
local api = vim.api

-- General Display
opt.encoding = "utf-8" -- Encoding used for displaying file
opt.backspace = {
  "indent",
  "eol",
  "start"
}                         -- Fixes backspace functionality

opt.number = true         -- Show line numbers down the left
opt.relativenumber = true -- Show relative line numbers
opt.ruler = true          -- Show the cursor position all the time
opt.cursorline = true     -- Highlight cursor line
opt.colorcolumn = "100"    -- Vertical line at pos 80

opt.scrolloff = 15        -- Adds lines at the end of the file to allow for scrolling
opt.showmatch = true      -- Highlight matching braces
opt.showmode = false      -- Don't show the mode VIM is currently in

-- Tabs & Indentation
opt.tabstop = 2       -- Set tab sizing to 4 spaces
opt.shiftwidth = 2    -- Number of spaces when shifting a line `<<` or `>>`
opt.expandtab = true  -- Ensures spaces are used instead of tab
opt.autoindent = true -- Auto indents
opt.linebreak = true  -- Line break on word
opt.wrap = false      -- Don't wrap lines

-- Split Layouts
opt.splitbelow = true -- Creates active Split Below, :sp
opt.splitright = true -- Creates active Split Left, :vs

-- Folding
opt.foldmethod = "indent" -- Fold on indentation
opt.foldlevel = 99        -- Fully unfold by default

-- Searching
opt.hlsearch = true   -- Highlights search results
opt.ignorecase = true -- Case-insensitive search
opt.incsearch = true  -- Incremental searching
opt.smartcase = true  -- Makes capital search case-sensitive
opt.ignorecase = true -- But not for lowercase searches

-- Universal Clipboard
opt.clipboard = "unnamedplus"

-- Treats <word>-<word> as a single word
opt.iskeyword:append("-")

-- Autocommands for spell checking in markdown, gitcommit, and text files
api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "gitcommit", "text" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.complete:append("kspell")
  end
})

-- Idel timeout before things start to happen
vim.o.updatetime = 300
-- vim.o.winborder = 'rounded'
