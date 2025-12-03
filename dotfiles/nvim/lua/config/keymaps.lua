local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.g.mapleader = " "

local function laptop_navigation()
  -- Navigation
  map('', 'i', '<Up>')
  map('', 'j', '<Left>')
  map('', 'k', '<Down>')

  -- Swaps i & h
  map('n', 'h', 'i', { noremap = true })

  -- Split Movement
  map("n", "<C-i>", "<C-w>k", opts) -- up
  map("n", "<C-k>", "<C-w>j", opts) -- down
  map("n", "<C-j>", "<C-w>h", opts) -- left
  map("n", "<C-l>", "<C-w>l", opts) -- right

  -- Tab control
  map("n", "<leader>kj", ":tabprevious<CR>", opts) -- Previous tab
  map("n", "<leader>kl", ":tabnext<CR>", opts) -- Next tab
end

local function lily58()
  -- Split Movement
  map("n", "<C-c>", "<C-w>k", opts) -- up
  map("n", "<C-t>", "<C-w>j", opts) -- down
  map("n", "<C-h>", "<C-w>h", opts) -- left
  map("n", "<C-n>", "<C-w>l", opts) -- right

  -- Tab Control
  map("n", "<leader>th", ":tabprevious<CR>", opts) -- Previous tab
  map("n", "<leader>tn", ":tabnext<CR>", opts) -- Next tab
end

-- Yes this is a hack way to do this, im working on something better
-- Issues this has:
-- Can't toggle twice in a session because of overwrites
-- Does'n save state between sessions
vim.g.current_layout = vim.g.current_layout or 'lily'

local function apply_layout()
  if vim.g.current_layout == 'lily' then
    lily58()
  else
    laptop_navigation()
  end
  vim.notify('Layout: ' .. vim.g.current_layout)
end

apply_layout()

-- :ToggleLayout command
vim.api.nvim_create_user_command('ToggleLayout', function()
  vim.g.current_layout = (vim.g.current_layout == 'laptop') and 'desktop' or 'laptop'
  apply_layout()
end, {})

-- Shared Keybinds --
-- Increment and Decrement
map("n", "<leader>=", "<C-a>", opts)
map("n", "<leader>-", "<C-x>", opts)

-- Save on exit insert mode
map("i", "<Esc>", "<Esc>:w<CR>", opts)

-- Terminal Mode -> Normal Mode
map("t", "<Esc>", "<C-\\><C-N>", opts)

-- Split control
map("n", "<leader>sv", "<C-w>v", opts) -- Vertical split
map("n", "<leader>sh", "<C-w>s", opts) -- Horizontal split
map("n", "<leader>se", "<C-w>=", opts) -- Equalize splits
map("n", "<leader>sx", ":close<CR>", opts) -- Close current split

-- Double <Esc> removes highlight
map("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>", opts)

-- Tab control
map("n", "<leader>to", ":tabnew<CR>", opts) -- Open new tab
map("n", "<leader>tx", ":tabclose<CR>", opts) -- Close tab
