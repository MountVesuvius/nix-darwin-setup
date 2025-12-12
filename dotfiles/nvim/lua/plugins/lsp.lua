-- Format & fix
local function clean_format()
  vim.lsp.buf.format({})
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.fixAll" },
      diagnostics = {},
    },
  })
end

local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }

  -- Nav
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
  end, opts)
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

  -- Actions
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>cf", clean_format, opts)

  -- Diagnostics next/prev
  vim.keymap.set("n", "<leader>ih", function()
    vim.diagnostic.jump({ float = true, count = -1, wrap = true })
  end, opts)
  vim.keymap.set("n", "<leader>in", function()
    vim.diagnostic.jump({ float = true, count = 1, wrap = true })
  end, opts)

  -- Semantic tokens
  if client.server_capabilities.semanticTokensProvider then
    local augroup = vim.api.nvim_create_augroup("SemanticTokens_" .. bufnr, {})
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged" }, {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.semantic_tokens.start(bufnr, client.id)
      end,
    })
    vim.lsp.semantic_tokens.start(bufnr, client.id)
  end

  -- Document highlight
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- helper to extend + enable servers via nvim-lspconfig’s defaults
local function setup(server, opts)
  opts = opts or {}
  opts.on_attach = opts.on_attach or on_attach
  opts.autostart = false

  -- Use nvim-lspconfig's built-in defaults for `server`,
  -- then extend them via vim.lsp.config
  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end

return {
  {
    "actionshrimp/direnv.nvim",
    opts = {
      async = true,
      on_direnv_finished = function()
        -- You probably also want to pair this with `autostart = false` in any `lspconfig` calls - see 'LSP config examples' below!
        vim.cmd("LspStart")
      end
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
    },
    config = function()
      require("neodev").setup()

      -- lua_ls with extra settings
      setup("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      -- others use defaults from nvim-lspconfig + our on_attach
      setup("ts_ls")
      setup("eslint")
      setup("gopls")
      setup("clangd")
      setup("sqls")

      setup("nil_ls", {
        settings = {
          ["nil"] = {
            formatting = {
              command = { "nixfmt" }, -- or nixfmt-rfc-style
            },
          },
        },
      })
    end,
  },
}
