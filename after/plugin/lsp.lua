-- this provides nice defaults
local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Go to definition." })
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "Display LSP hover." })
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, remap = false, desc = "View workspace symbol." })
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc = "Open diagnostic float." })
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc = "Go to next diagnostic message." })
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false, desc = "Go to previous diagnostic message." })
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "View and execute available code actions." })
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false, desc = "View the references of the current symbol." })
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc = "Rename the current symbol." })
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, remap = false, desc = "Display signature help." })
end)

require("mason").setup({})

-- had to do this separate from configuration PyLspInstall python-lsp-install ruff
-- is there some way to do this automagically?
-- this is where pylsp puts its environment: "/home/doug/.local/share/nvim/mason/packages/python-lsp-server/venv"
require("mason-lspconfig").setup({
	ensure_installed = {'ts_ls', 'pylsp', "ruff", "lua_ls"},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
            local library = lua_opts.settings.Lua.workspace.library

            -- grab paths to all of the installed plugins (this only kinda works)
            for _, v in pairs(vim.opt.rtp:get()) do
                if string.find(v, "/lazy/") then
                    library[#library + 1] = v .. "/lua"
                end
            end
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	}
})

require("lspconfig").pylsp.setup{
    settings={
        pylsp={
            plugins={
                pycodestyle={
                    enabled=false,
                }
            }
        }
    }
}

require("lspconfig").ruff.setup{
    settings={}
}

-- autocomplete library
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
	},
	formatting = lsp.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-space>"] = cmp.mapping.complete(),
	}),
})
