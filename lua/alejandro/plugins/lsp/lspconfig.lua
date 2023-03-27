-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap -- for conciseness

local on_attach = function(client, bufnr)

     -- keybind options
     local opts = { noremap = true, silent = true, buffer = bufnr }

     keymap.set("n", "gd", "<cmd>vim.lsp.buf.definition<CR>", opts)
     keymap.set("n", "gh", "<cmd>vim.lsp.buf.hover<CR>", opts)
     keymap.set("n", "<leader>vws", "<cmd>vim.lsp.buf.workspace_symbol<CR>", opts)
     keymap.set("n", "<leader>vd", "<cmd>vim.diagnostic.open_float<CR>", opts)
     keymap.set("n", "<leader>n", "<cmd>vim.diagnostic.goto_next<CR>", opts)
     keymap.set("n", "<leader>m", "<cmd>vim.diagnostic.goto_prev<CR>", opts)
     keymap.set("n", "<leader>vca", "<cmd>vim.lsp.buf.code_action<CR>", opts)
     keymap.set("n", "<leader>vrr", "<cmd>vim.lsp.buf.references<CR>", opts) -- NOTE: para ver la referencia dnd aparece la variable
     keymap.set("n", "<leader>vrn", "<cmd>vim.lsp.buf.rename<CR>", opts) -- NOTE: para cmabiar el nombre en todo el archivo..
     keymap.set("n", "<leader>sh", "<cmd>vim.lsp.buf.signature_help<CR>", opts)

 
     -- typescript specific keymaps (e.g. rename file and update imports)
     if client.name == "tsserver" then
         keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
         keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
         keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
     end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure lua_ls server
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure intelephense server
lspconfig["intelephense"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure quick_lint_js server
lspconfig["quick_lint_js"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


-- configure eslint server
lspconfig["eslint"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})


