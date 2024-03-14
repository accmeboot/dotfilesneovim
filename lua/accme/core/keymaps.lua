vim.g.mapleader = " "

local keymap = vim.keymap

-- nh for cleaning highlights after search
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- splitting windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sc", ":close<CR>") -- close current split window

-- save file --
keymap.set("n", "<leader>w", ":update<CR>")

keymap.set("n", "<S-l>", ":bnext<CR>")
keymap.set("n", "<S-h>", ":bprev<CR>")


--lsp reload --
keymap.set("n", "<leader>RR", ":LspRestart<CR>")

--toggle relative number
keymap.set("n", "<leader>n", ":set number! relativenumber!<cr>")

-- open explorer
keymap.set("n", "<leader>e", ":Ex<cr>")

-- open fugitive
keymap.set("n", "<leader>g", ":tab G<cr>")

-- quit
keymap.set("n", "<leader>q", ":q<cr>")

-- moving selection
keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv")
keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv")

-- resize split windows
keymap.set("n", "<leader>]", ":vertical resize -5<CR>")
keymap.set("n", "<leader>[", ":vertical resize +5<CR>")
keymap.set("n", "<leader>{", ":resize -5<CR>")
keymap.set("n", "<leader>}", ":resize +5<CR>")

-- Preserve the copied value
keymap.set("x", "<leader>p", '"_dP')

-- center on scroll
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- spell suggestion
keymap.set("n", "<leader>m", ":SpellSuggest<CR>")
