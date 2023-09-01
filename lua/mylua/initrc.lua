vim.lsp.set_log_level(vim.lsp.log_levels.DEBUG)
--
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.api.nvim_create_user_command('W', function (command)
    local tempfile = vim.fn.tempname()
    local filename = command.args
    if not command.args or #command.args == 0 then
        filename = vim.fn.expand("%")
    end

    if not filename  or #filename == 0 then
        vim.api.nvim_err_writeln("E32: No file name")
    end

    vim.api.nvim_exec(string.format("write! %s", tempfile), true)

    vim.fn.inputsave()
    local pass = vim.fn.inputsecret("Enter Password: ")
    vim.fn.inputrestore()
    vim.api.nvim_echo({{"\n"}}, false, {})


    if not pass or #pass == 0 then
        return
    end

    local cp_cmd = string.format("sudo -p '' -S dd if=%s of=%s bs=1M",
                        vim.fn.shellescape(tempfile),
                        vim.fn.shellescape(filename))
    local res = vim.fn.system(cp_cmd, pass)
    vim.fn.delete(tempfile)

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_err_writeln(string.format("Error: command exited with %s", vim.v.shell_error))
        vim.api.nvim_echo({res}, true, {})
    else
        vim.api.nvim_echo({{string.format("%s written", filename)}}, true, {})
        vim.api.nvim_echo({{res}}, false, {})
    end

end, { bang = true, nargs = "?", desc = "write buffer contents to file using sudo", complete = "file" })

require('mylua/lsp')
require('mylua/tree_sitter')
require('mylua/F')
require('mylua/cmp')
require('mylua/telescope')
require('mylua/file_browser')
