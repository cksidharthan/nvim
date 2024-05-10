return {
  'crispgm/nvim-go',
  ft = 'go',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'rcarriga/nvim-notify',
    'neovim/nvim-lspconfig',
  },
  config = function()
    -- setup nvim-go
    require('go').setup({})

    -- setup lsp client
    require('lspconfig').gopls.setup({}) 
  end,
}
