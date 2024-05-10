return {
  'kevinhwang91/nvim-ufo', 
  dependencies = {
    'kevinhwang91/promise-async'
  },
  event = 'VeryLazy',
  config = function()
    local ftMap = {
      vim = 'indent',
      python = {'indent'},
      git = ''
    }
    require('ufo').setup({
      open_fold_hl_timeout = 150,
      close_fold_kinds_for_ft = {
          default = {'imports', 'comment'},
          json = {'array'},
          c = {'comment', 'region'}
      },
      preview = {
          win_config = {
              border = {'', '─', '', '', '', '─', '', ''},
              winhighlight = 'Normal:Folded',
              winblend = 0
          },
          mappings = {
              scrollU = '<C-u>',
              scrollD = '<C-d>',
              jumpTop = '[',
              jumpBot = ']'
          }
      },
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    })
  end
}
