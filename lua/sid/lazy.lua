local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable branch
    lazyppath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   { import = "sid.plugins" },
}, {
  -- defaults = { lazy = true },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = true, -- get a notification when changes are found
  },
  checker = {
    enabled = true,
    notify = false,
  },
  debug = false,
})
