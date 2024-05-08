return {
  'akinsho/bufferline.nvim',
  version = "*", 
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffer",
        show_tab_indicators = true,
        diagnostics = "nvim_lsp",
        hover = {
          enabled = true,
          delay = 150,
          reveal = {'close'}
        },
        offsets = {
          {
              filetype = "NvimTree",
              text = "File Explorer", 
              text_align = "center",
              separator = true,
          },
        },  
      },
    }
  end,
}
