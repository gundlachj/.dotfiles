-- Add spaces instead of tab character
vim.cmd("set expandtab")

-- Set number of spaces in a tab
-- For C:
--vim.cmd("set tabstop=2")
--vim.cmd("set softtabstop=2")
--vim.cmd("set shiftwidth=2")
--For Java:
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set scrolloff=8")

-- Set leader key
vim.g.mapleader = " "

-- Remove the use of a swap file
vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- line numbers
vim.opt.nu = true -- current line number
vim.opt.relativenumber = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Column used for showing warning and errors by lsps
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- That stupid line in the middle of the screen
--vim.opt.colorcolumn = "80"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- find and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- semicolons
vim.keymap.set("n", ";", "$a;<ESC>")

-- diagnostic text displayed directly in editor
vim.diagnostic.config({virtual_text = true})

-- Change keymaps for commenting
vim.keymap.set("n", "<leader>rc", "gc")

-- Configure fzf to run
vim.opt.runtimepath:append("/opt/homebrew/opt/fzf")

-- Netrw Directory Listing
vim.keymap.set("n", "-", ":Explore<CR>")
vim.g.netrw_list_style = 3

-- Setting up diagnostic keymaps
vim.keymap.set({ "n", "x" }, "<leader>]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set({ "n", "x" }, "<leader>[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- REdo
vim.keymap.set("n", "U", "<c-r>")
