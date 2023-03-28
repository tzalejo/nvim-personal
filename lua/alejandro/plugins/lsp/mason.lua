-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		-- "eslint",

		-- lua
		"lua_ls",

		"clangd",

		-- html y css
		"html",
		"cssls",
		"tailwindcss",

		-- php
		"intelephense",
		-- "phpactor",
		-- "psalm",

		-- javascript
		"quick_lint_js",
		"tsserver",

		--typescript
		"vtsls",
		-- 'eslint_d',
		-- 'typescript-language-server',
		-- 'eslint-lsp',

		-- docker
		"dockerls",
		"docker_compose_language_service",

		-- sql
		"sqlls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"hadolint", -- dockerfile
		"php_cs_fixer", --php
		"phpcbf", --php
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
