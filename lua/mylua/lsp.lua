local nvim_lsp = require('lspconfig')

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '\\e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '\\dl', function () require'telescope.builtin'.diagnostics(0) end, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- Note: adds jumps to tagstack (use CTRL-T )
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

  -- Note: press 'K' twice to move cursor insider the floating buffer
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '\\wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '\\wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '\\wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '\\D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '\\rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '\\ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '\\f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    vim.keymap.set('n', '<localleader>f', vim.lsp.buf.formatting, bufopts)
  elseif client.server_capabilities.document_range_formatting then
    vim.keymap.set('n', '<localleader>f', vim.lsp.buf.formatting, bufopts)
  end

  -- call on_attach for nvim-completion
  -- require'completion'.on_attach(client, bufnr)

  -- Set autocommands conditional on server_capabilities
  -- if client.server_capabilities.document_highlight then
  --   vim.api.nvim_exec([[
  --     hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
  --     hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
  --     hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]], false)
  -- end
end

local lsp_flags = {
    debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp['pyright'].setup({on_attach = on_attach, flags = lsp_flags, capabilities = capabilities})
nvim_lsp['clangd'].setup( {on_attach = on_attach, flags = lsp_flags, capabilities = capabilities})
nvim_lsp['jdtls'].setup(  {on_attach = on_attach, flags = lsp_flags, capabilities = capabilities})
nvim_lsp['texlab'].setup( {on_attach = on_attach, flags = lsp_flags, capabilities = capabilities})
nvim_lsp['eslint'].setup( {on_attach = on_attach, flags = lsp_flags, capabilities = capabilities})
