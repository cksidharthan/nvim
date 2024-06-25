-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
})

-- create a group to assign json comamnds. Right now, it only formats json using jq
vim.api.nvim_create_augroup("JsonFormatting", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "JsonFormatting",
  pattern = "json",
  callback = function()
    vim.api.nvim_buf_create_user_command(0, 'FormatJSON', function(opts)
      local start_line = opts.line1
      local end_line = opts.line2
      vim.cmd(string.format('%d,%d!jq \'.\'', start_line, end_line))
      vim.api.nvim_echo({
        {'JSON formatted using jq. Make sure jq is installed!', 'WarningMsg'}
      }, true, {})
    end, {range = '%'})
  end
})

-- Create group to assign commands
-- "clear = true" must be set to prevent loading an
-- auto-command repeatedly every time a file is resourced
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     pattern = { "*.yaml", "*.yml" },
--     desc = "Auto-format YAML files after saving",
--     callback = function()
--         local fileName = vim.api.nvim_buf_get_name(0)
--         vim.cmd(":!yamlfmt " .. fileName) -- or vim.cmd(":silent !yamlfmt " .. fileName)
--     end,
--     group = autocmd_group,
-- })

