vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

-- Navigation
vim.keymap.set('', 'i', '<Up>')
vim.keymap.set('', 'j', '<Left>')
vim.keymap.set('', 'k', '<Down>')
vim.keymap.set('', 'h', 'i', opts) -- Swaps i & h
vim.keymap.set("n", "<C-h>", "<C-i>", opts) -- fixes the jumplist issue

-- Split Movement
vim.keymap.set("n", "<C-i>", "<C-w>k", opts) -- up
vim.keymap.set("n", "<C-k>", "<C-w>j", opts) -- down
vim.keymap.set("n", "<C-j>", "<C-w>h", opts) -- left
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- right

-- Split control
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts) -- Vertical split
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts) -- Horizontal split
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- Equalize splits
vim.keymap.set("n", "<leader>sx", ":close<CR>", opts) -- Close current split

-- Tab movement 
vim.keymap.set("n", "<leader>kj", ":tabprevious<CR>", opts) -- Previous tab
vim.keymap.set("n", "<leader>kl", ":tabnext<CR>", opts) -- Next tab

-- Tab control
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- Open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- Close tab

-- Save on exit insert mode
vim.keymap.set("i", "<Esc>", "<Esc>:w<CR>", opts)

-- Terminal Mode -> Normal Mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", opts)

-- Double <Esc> removes highlight
vim.keymap.set("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>", opts)

-- Increment and Decrement
vim.keymap.set("n", "<leader>=", "<C-a>", opts)
vim.keymap.set("n", "<leader>-", "<C-x>", opts)

-- Native commenting (gc/gcc) is built into Neovim 0.10+
vim.keymap.set("n", "<leader>cl", "gcc", { remap = true, silent = true })
vim.keymap.set("x", "<leader>cl", "gc", { remap = true, silent = true })
