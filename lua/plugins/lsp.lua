return {
  'neovim/nvim-lspconfig',
  version = '2.9.0',
  config = function()
    vim.lsp.enable('clangd')

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/definition') then
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'LSP go to definition' })
        end
        if client:supports_method('textDocument/declaration') then
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'LSP go to declaration' })
        end
      end,
    })
  end,
}
