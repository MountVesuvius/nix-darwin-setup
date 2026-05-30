local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', { capabilities = capabilities })

vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("clangd")
vim.lsp.enable("nil_ls")
vim.lsp.enable("cssls")
vim.lsp.enable("emmet_ls")
vim.lsp.enable("lua_ls")

-- vim.lsp.enable("angularls")
-- vim.lsp.enable("vue_ls")
-- vim.lsp.enable("sqls")

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
local builtin = require("telescope.builtin")
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})

vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols)
vim.keymap.set("n", "<leader>gb", builtin.git_branches)

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

