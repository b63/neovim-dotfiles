-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
local fb_actions = require "telescope".extensions.file_browser.actions

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
            ['fc'] = fb_actions.create,
            ['fd'] = fb_actions.remove,
            ['fm'] = fb_actions.move,
            ['fy'] = fb_actions.copy,
            ['fr'] = fb_actions.rename,
            [";"] = function(prompt_bufnr)
                local current_picker = require'telescope.actions.state'.get_current_picker(prompt_bufnr)
                local path = current_picker.finder.cwd
                require'telescope.actions'.close(prompt_bufnr)
                vim.call('OpenScratchTermDir', path)
            end
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

local config_file_browser = function()
    local telescope = require("telescope")
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<leader>dd', function() telescope.extensions.file_browser.file_browser({path = vim.fn.expand("%:p:h"), layout_strategies=current_buffer}) end, opts)
    vim.keymap.set('n', '<leader>dh', function() telescope.extensions.file_browser.file_browser({path = "~/", layout_strategies=current_buffer}) end, opts)
end

config_file_browser()
