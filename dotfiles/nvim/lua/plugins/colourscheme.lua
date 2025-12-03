return {
    {
        "tiagovla/tokyodark.nvim",
        opts = {
            terminal_colors = true,
            lazy = false, -- Want it to instantly load
            priority = 1000, -- Want it to load first
            gamma = 1,
        },
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
            vim.cmd [[colorscheme tokyodark]]

            -- vim.cmd([[highlight Normal guibg=NONE]])
            -- vim.cmd([[highlight NormalNC guibg=NONE]])
            -- vim.cmd([[highlight EndOfBuffer guibg=NONE]])

            -- local opacity = 0.8
            -- vim.api.nvim_set_hl(0, "Normal", {bg = "NONE", blend = math.floor((1 - opacity) * 100})
            -- set(0, "Normal", {bg = "NONE", blend = math.floor((1 - opacity) * 100)})
            -- set(0, "NormalFloat", {bg = "NONE", blend = math.floor((1 - opacity) * 100)})
        end,
    }
}
