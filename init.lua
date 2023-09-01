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
    vim.keymap("n", "<leader>;", ":call OpenScratchTerm()<CR>")
    vim.keymap("n", "<leader>:", ":call OpenScratchTermDir(expand('%:p:h'))<CR>")
    vim.keymap("t", "<C-W>N", "<C-\\><C-N>")
end

require'mylua/initrc'
--vim.cmd("colorscheme ayu")
