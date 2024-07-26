-- keymap file

local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes 
-- 	normal_mode = "n",
-- 	insert_mode = "i",
-- 	visual_mode = "v",
-- 	visual-block-mode = "x"
-- 	term_mode = "t"
-- 	command_mode = "c"

-- Normal --
-- Better window naviation

keymap("n", "<leader>e", ":Lex 30<cr>", opts)


--  Insert  --
-- jk fast to press escape
keymap("i", "jk", "<esc>", opts)



-- Visual --
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
