vim.cmd("let $CONFPATH=$HOME.'.config/nvim'")
vim.opt_global.exrc = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.guifont = "Monaco:h12"

-- loading plugsin (using packer)
require'plugins'

-- Plugin Config: {{{1
local config_terminal_plugin = function()
    vim.g.floaterm_autoclose = 1

    vim.g.floaterm_autoclose = 1
    vim.g.floaterm_height = 0.4
    vim.g.floaterm_wintype = 'split'
    vim.keymap.set("n", "<leader>;", ":call OpenScratchTerm()<CR>")
    vim.keymap.set("n", "<leader>:", ":call OpenScratchTermDir(expand('%:p:h'))<CR>")
    vim.keymap.set("t", "<C-W>n", "<C-\\><C-N>")
    vim.keymap.set("t", "<C-W>;", "<C-\\><C-N>:call OpenScratchTerm()<CR>")
end

require'mylua/initrc'
config_terminal_plugin()
--vim.cmd("colorscheme ayu")
