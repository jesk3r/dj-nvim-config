local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Snippet support
require('luasnip.loaders.from_vscode').lazy_load() -- Loads friendly-snippets

lsp_zero.on_attach(function(client, bufnr)
  -- Default keymaps
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- CMP setup for autocompletion
local cmp_select = {behavior = cmp.SelectBehavior.Select}


-- Mason setup to install LSP servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'typescript-language-server', 'rust_analyzer', 'pyright', 'html', 'cssls', 'jsonls'},
  handlers = {
    function(server_name)
      local lspconfig = require('lspconfig')
      
      -- Default capabilities from LSP protocol
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Enable snippet support for completion
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- LSP server setup
      lspconfig[server_name].setup({
        capabilities = capabilities
      })
    end,
  },
})
