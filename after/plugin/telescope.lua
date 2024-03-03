local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files in workspace." })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search git files." })
vim.keymap.set("n", "<leader>ps", builtin.grep_string, { desc = "Grep for the string under the cursor." })
vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Activate live grep in Telescope" })

