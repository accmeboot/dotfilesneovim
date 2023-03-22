vim.g.mapleader = " "

local keymap = vim.keymap

-- jj for escape
keymap.set("i", "jj", "<ESC>")

-- nh for cleaning highlights after search
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- splitting windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sc", ":close<CR>") -- close current split window

-- save file --
keymap.set("n", "<leader>w", ":update<CR>")

-- working with tabs --
keymap.set("n", "<S-j>", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>fc", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<S-l>", ":tabn<CR>") -- close current tab
-- keymap.set("n", "<S-h>", ":tabp<CR>") -- close current tab

-- close the buffer without closing the window ## works really slow
keymap.set("n", "<leader>q", ":enew<bar>bd #<CR>")

keymap.set("n", "<S-l>", ":bnext<CR>") -- close current tab
keymap.set("n", "<S-h>", ":bprev<CR>") -- close current tab

keymap.set("n", "<leader>Q", "<esc>:wq!<cr>") -- save and close

-- file explorer --
keymap.set("n", "<leader>e", ":NeoTreeFocusToggle<CR>")
keymap.set("n", "<leader>E", ":NeoTreeFloatToggle<CR>")

keymap.set("n", "<leader>b", ":Neotree buffers toggle<CR>")

-- telescope --
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>")

--lsp reload --
keymap.set("n", "<leader>RR", ":LspRestart<CR>")

-- cmdline --
keymap.set("n", "<leader>t", "<cmd>FineCmdline<CR>")
