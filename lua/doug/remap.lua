vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- allow for shifting hilighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When using J this makes the cursor stay at the beginning of the line
vim.keymap.set("n", "J", "mzJ`z")

-- when going half-page up/down, this resets the cursor to be in the center of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps the search term in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- deletes the selected text and pastes over it from the paste buffer, without changing the contents of the print buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- paste from system clipboard
vim.keymap.set("n", "<leader>p", [["+p]])

-- deletes to the void register (not into the paste buffer)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- gets rid of the control c stuff (which is kinda confusing right now)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- kills Q
vim.keymap.set("n", "Q", "<nop>")

-- apply autoformatting to file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- remove leading whitespace from lines
vim.keymap.set("n", "<leader>w", [[mz:%s/[ \r]\+$//g<CR>:<Esc>`z]])

-- navigates the quick fix stuff
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- starts replacing the current word that you're on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- shouts out the page
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
