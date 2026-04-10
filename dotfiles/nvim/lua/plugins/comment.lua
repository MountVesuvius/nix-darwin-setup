-- Native commenting (gc/gcc) is built into Neovim 0.10+
-- Just remap <leader>cl to the native operator
vim.keymap.set("n", "<leader>cl", "gcc", { remap = true, silent = true })
vim.keymap.set("x", "<leader>cl", "gc", { remap = true, silent = true })

return {}
