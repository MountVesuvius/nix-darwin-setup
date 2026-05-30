local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.g.mapleader = " "

-- Navigation
map('', 'i', '<Up>')
map('', 'j', '<Left>')
map('', 'k', '<Down>')
map('', 'h', 'i', opts) -- Swaps i & h
map("n", "<C-h>", "<C-i>", opts) -- fixes the jumplist issue

-- Split Movement
map("n", "<C-i>", "<C-w>k", opts) -- up
map("n", "<C-k>", "<C-w>j", opts) -- down
map("n", "<C-j>", "<C-w>h", opts) -- left
map("n", "<C-l>", "<C-w>l", opts) -- right

-- Split control
map("n", "<leader>sv", "<C-w>v", opts) -- Vertical split
map("n", "<leader>sh", "<C-w>s", opts) -- Horizontal split
map("n", "<leader>se", "<C-w>=", opts) -- Equalize splits
map("n", "<leader>sx", ":close<CR>", opts) -- Close current split

-- Tab movement 
map("n", "<leader>kj", ":tabprevious<CR>", opts) -- Previous tab
map("n", "<leader>kl", ":tabnext<CR>", opts) -- Next tab

-- Tab control
map("n", "<leader>to", ":tabnew<CR>", opts) -- Open new tab
map("n", "<leader>tx", ":tabclose<CR>", opts) -- Close tab

-- Save on exit insert mode
map("i", "<Esc>", "<Esc>:w<CR>", opts)

-- Terminal Mode -> Normal Mode
map("t", "<Esc>", "<C-\\><C-N>", opts)

-- Double <Esc> removes highlight
map("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>", opts)

-- Increment and Decrement
map("n", "<leader>=", "<C-a>", opts)
map("n", "<leader>-", "<C-x>", opts)
