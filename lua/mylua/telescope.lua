
telescope = require'telescope'
-- require('telescope').setup{
--   defaults = {
--     file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
--     grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
--     qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new
--   }
-- }
builtin = require'telescope.builtin'
vim.keymap.set("n", "<leader>b",  function () require'telescope.builtin'.buffers({sort_mru = true, layout_strategy="vertical"}) end)
vim.keymap.set("n", "<leader>B",  function () require'telescope.builtin'.buffers({sort_mru = true, cwd_only=true, layout_strategy="vertical"}) end)
vim.keymap.set("n", "<leader>ff", function () require'telescope.builtin'.find_files({layout_strategy="vertical"}) end)
vim.keymap.set("n", "<leader>fh", function () require'telescope.builtin'.help_tags({layout_strategy="vertical"}) end)
vim.keymap.set("n", "<leader>fg", function () require'telescope.builtin'.live_grep({layout_config={vertical={preview_height=0.3}}, layout_strategy="vertical"}) end)
