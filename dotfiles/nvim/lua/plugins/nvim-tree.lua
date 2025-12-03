return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        disable_netrw = true,
        hijack_netrw = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_cwd = true,
        view = {
            side = "left",
            adaptive_size = true,
        },
        actions = {
            open_file = { quit_on_open = true }
        },
        git = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
    end,
}
