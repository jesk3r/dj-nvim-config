-- For init.lua
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action() 
require('luasnip.loaders.from_vscode').lazy_load() -- Loads friendly-snippets

local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
    },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  })
})
