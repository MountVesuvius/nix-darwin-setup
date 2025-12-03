local languages = {
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Automatically update parsers
        event = { "BufReadPre", "BufNewFile" }, -- Load only when needed
        opts = {
            ensure_installed = languages,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                -- keymaps = {
                    -- init_selection = "<CR>",
                    -- node_incremental = "<CR>",
                    -- scope_incremental = "<S-CR>",
                    --node_decremental = "<BS>",
                -- },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    }
}
