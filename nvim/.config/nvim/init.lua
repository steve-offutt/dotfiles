require("config.options")
require("config.keybinds")
require("config.lazy")

vim.lsp.config('*', {
    capabilities = {
	textDocument = {
	    semanticTokens = {
		multilineTokenSupport = true,
	    }
	}
    },
    root_markers = { '.git' },
})
---- Set to true if you have a Nerd Font installed and selected in the terminal
--vim.g.have_nerd_font = false
--
---- [[ Setting options ]]
---- See `:help vim.opt`
---- NOTE: You can change these options as you wish!
----  For more options, you can see `:help option-list`
--
---- Make line numbers default
--vim.opt.number = true
---- You can also add relative line numbers, to help with jumping.
----  Experiment for yourself to see if you like it!
--vim.opt.relativenumber = true
--
---- Enable mouse mode, can be useful for resizing splits for example!
--vim.opt.mouse = "a"
--
---- Don't show the mode, since it's already in the status line
--vim.opt.showmode = false
--
---- Enable break indent
--vim.opt.breakindent = true
--
---- Save undo history
--vim.opt.undofile = true
--
---- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
--vim.opt.ignorecase = true
--vim.opt.smartcase = true
--
---- Keep signcolumn on by default
--vim.opt.signcolumn = "yes"
--
---- Decrease update time
--vim.opt.updatetime = 250
--
---- Decrease mapped sequence wait time
---- Displays which-key popup sooner
--vim.opt.timeoutlen = 300
--
---- Configure how new splits should be opened
--vim.opt.splitright = true
--vim.opt.splitbelow = true
--
---- Sets how neovim will display certain whitespace characters in the editor.
----  See `:help 'list'`
----  and `:help 'listchars'`
--vim.opt.list = true
--vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
--
---- Preview substitutions live, as you type!
--vim.opt.inccommand = "split"
--
---- Show which line your cursor is on
--vim.opt.cursorline = true
--
---- Minimal number of screen lines to keep above and below the cursor.
--vim.opt.scrolloff = 10
--vim.opt.tabstop = 4
--vim.opt.softtabstop = 4
--vim.opt.shiftwidth = 4
--vim.opt.expandtab = true
--vim.opt.smartindent = true
--
---- [[ Basic Keymaps ]]
----  See `:help vim.keymap.set()`
--
---- Set highlight on search, but clear on pressing <Esc> in normal mode
--vim.opt.hlsearch = true
--vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
--
---- Diagnostic keymaps
--vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
--vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
--vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
--vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
--
--vim.keymap.set('n', '<leader>pv', ':Vex<CR>', { desc = "Open NetRW directory explorer" })
--vim.keymap.set('v', '<leader>p', '"_dP', { desc = "yank to void register" })
--vim.keymap.set('v', '<leader>y', '"+y', { desc = "yank to system clipboard" })
--
--vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "move line down" })
--vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "move line up" })
--
-- -- Source neovim config
--vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua', { desc = "Source neovim config" })
--
---- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
---- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
---- is not what someone will guess without a bit more experience.
----
---- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
---- or just use <C-\><C-n> to exit terminal mode
--vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
--
----  See `:help wincmd` for a list of all window commands
--vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
--vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
--vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
--vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
--
---- Highlight when yanking (copying) text
----  Try it with `yap` in normal mode
----  See `:help vim.highlight.on_yank()`
--vim.api.nvim_create_autocmd("TextYankPost", {
--	desc = "Highlight when yanking (copying) text",
--	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
--	callback = function()
--		vim.highlight.on_yank()
--	end,
--})
--
---- [[ Install `lazy.nvim` plugin manager ]]
----    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--if not vim.loop.fs_stat(lazypath) then
--	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
--end ---@diagnostic disable-next-line: undefined-field
--vim.opt.rtp:prepend(lazypath)
--
--require("lazy").setup({
--	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
--	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
--
--	-- NOTE: Plugins can also be added by using a table,
--	-- with the first argument being the link and the following
--	-- keys can be used to configure plugin behavior/loading/etc.
--	--
--	-- Use `opts = {}` to force a plugin to be loaded.
--	--
--	--  This is equivalent to:
--	--    require('Comment').setup({})
--
--	-- "gc" to comment visual regions/lines
--	{ "numToStr/Comment.nvim", opts = {} },
--
--	-- Here is a more advanced example where we pass configuration
--	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--	--    require('gitsigns').setup({ ... })
--	--
--	-- See `:help gitsigns` to understand what the configuration keys do
--	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
--		"lewis6991/gitsigns.nvim",
--		opts = {
--			signs = {
--				add = { text = "+" },
--				change = { text = "~" },
--				delete = { text = "_" },
--				topdelete = { text = "‾" },
--				changedelete = { text = "~" },
--			},
--		},
--	},
--	{
--		"neanias/everforest-nvim",
--		version = false,
--		lazy = false,
--		priority = 1000, -- make sure to load this before all the other start plugins
--		-- Optional; default configuration will be used if setup isn't called.
--		config = function()
--		  require("everforest").setup({
--		    -- Your config here
--		  })
--		end,
--		init = function()
--			-- Load the colorscheme here.
--			-- Like many other themes, this one has different styles, and you could load
--			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--			vim.cmd.colorscheme("everforest")
--
--			-- You can configure highlights by doing something like:
--			vim.cmd.hi("Comment gui=none")
--		end,
--	},
--	{ -- Autoformat
--		"stevearc/conform.nvim",
--		lazy = false,
--		keys = {
--			{
--				"<leader>f",
--				function()
--					require("conform").format({ async = true, lsp_fallback = true })
--				end,
--				mode = "",
--				desc = "[F]ormat buffer",
--			},
--		},
--		opts = {
--			notify_on_error = false,
--			format_on_save = function(bufnr)
--				-- Disable "format_on_save lsp_fallback" for languages that don't
--				-- have a well standardized coding style. You can add additional
--				-- languages here or re-enable it for the disabled ones.
--				local disable_filetypes = { c = true, cpp = true }
--				return {
--					timeout_ms = 500,
--					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
--				}
--			end,
--			formatters_by_ft = {
--				lua = { "stylua" },
--				-- Conform can also run multiple formatters sequentially
--				python = { "isort", "black" },
--				--
--				-- You can use a sub-list to tell conform to run *until* a formatter
--				-- is found.
--				-- javascript = { { "prettierd", "prettier" } },
--			},
--		},
--	},
--})
--
--
