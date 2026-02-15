vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("angularls")
vim.lsp.enable("vue_ls")
vim.lsp.enable("sqls")
vim.lsp.enable("clangd")
vim.lsp.enable("nil_ls")
vim.lsp.enable("cssls")
-- vim.lsp.enable("tailwindcss")
vim.lsp.enable("emmet_ls")

-- vim.lsp.config('basedpyright', {
-- settings = {
--     -- fluff for one project
--     basedpyright = {
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--         extraPaths = {
--           "./test-bench/apps/frappe",
--           "./test-bench/apps/erpnext",
--           "./custom_fields_app" 
--         },
--       },
--     },
--   },
-- })
--
-- vim.lsp.enable('basedpyright')

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

-- keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded" })
end, {})
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {})

-- Actions
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>cf", clean_format, {})

-- Diagnostics next/prev
vim.keymap.set("n", "<leader>ih", function()
  vim.diagnostic.jump({ float = true, count = -1, wrap = true })
end, {})
vim.keymap.set("n", "<leader>in", function()
  vim.diagnostic.jump({ float = true, count = 1, wrap = true })
end, {})

