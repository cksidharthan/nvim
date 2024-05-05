return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
  
      -- set header 
      dashboard.section.header.val = {
        "                                                     ",
        "                                                     ",
        "                                                     ",
        "                                                     ",
        "             ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "             ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "             ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "             ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "             ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "             ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                      ",
        "                                                     ",
        '                           oooo$$$$$$$$$$$$oooo',
        '                        oo$$$$$$$$$$$$$$$$$$$$$$$$o',
        '                     oo$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o         o$   $$ o$',
        '     o $ oo        o$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o       $$ $$ $$o$',
        '  oo $ $ "$      o$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$o       $$$o$$o$',
        '  "$$$$$$o$     o$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$o    $$$$$$$$',
        '   $$$$$$$    $$$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$$$$$$$$$$$$$$',
        '    $$$$$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$$$$$$  """$$$',
        '     "$$$""""$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     "$$$',
        '     o$$"   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$       $$$o',
        '     $$$    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" "$$$$$$ooooo$$$$o',
        '    o$$$oooo$$$$$  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   o$$$$$$$$$$$$$$$$$',
        '   """"$$$$"" $$$$    "$$$$$$$$$$$$$$$$$$$$$$$$$$$$"      o$$$',
        '              "$$$o     """$$$$$$$$$$$$$$$$$$"$$"         $$$',
        '                $$$o          "$$""$$$$$$""""           o$$$',
        '                 $$$$o                 oo             o$$$"',
        '                  "$$$$o      o$$$$$$o"$$$$o        o$$$$',
        '                    "$$$$$oo     ""$$$$o$$$$$o   o$$$$""  ',
        '                       ""$$$$$oooo  "$$$o$$$$$$$$$"""',
        '                          ""$$$$$$$oo $$$$$$$$$$       ',
        '                                  """"$$$$$$$$$$$        ',
        '                                       $$$$$$$$$$"      ',
        '                                        "$$$""""        ',
      }
  
      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
        dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
        dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
        dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
      }
  
      -- Send config to alpha
      alpha.setup(dashboard.opts)
  
      -- Disable folding on alpha buffer
      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}