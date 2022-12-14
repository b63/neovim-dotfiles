local cmp = require('cmp')

cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    }),
    window = {
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    experimental = {
        native_menu = false,
        ghost_text = true,
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                buffer = '[buf]',
                nvim_lsp = '[lsp]',
                path = '[path]',
                nvim_lua = '[lua]',
            })[entry.source.name]
            return vim_item
        end
    }
})

-- require('cmp').setup.buffer({enabled = false})
vim.cmd('command AutoCmpOn  lua require("cmp").setup.buffer{enabled=false}')
vim.cmd('command AutoCmpOff lua require("cmp").setup.buffer{enabled=true}')
