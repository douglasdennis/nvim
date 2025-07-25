local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            color_overrides = {
                mocha = {
                    base = "#000000",
                    mantle = "#000000",
                    crust = "#000000",
                },
            },
        },
    },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "python", "java", "rust", "sql", "scala" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{ "mbbill/undotree" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
    { "mrcjkb/rustaceanvim", version = '^5', lazy = false },
    { "nvimtools/none-ls.nvim", config = function()
        local none_ls = require("null-ls")
        none_ls.setup({
          sources = {
            none_ls.builtins.formatting.stylua,
            none_ls.builtins.formatting.prettier,
          },
        })
      end
    },
})
-- require("lazy").setup({
-- 	"folke/which-key.nvim",
-- 	{ "folke/neoconf.nvim", cmd = "Neoconf" },
-- 	"folke/neodev.nvim",
-- })
