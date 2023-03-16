local status, autoSave = pcall(require, "auto-save")
if not status then
  vim.notify("AutoSave not found!")
  return
end

autoSave.setup({
  enabled = true,
  execution_message = {
    message = function() -- message to print on save
      return ("saved at " .. vim.fn.strftime("%H:%M:%S"))
    end,
  },

  events = { "InsertLeave", "TextChanged" },
  conditions = {
    exists = true,
    filename_is_not = { "plugins.lua" },
    filetype_is_not = {},
    modifiable = true,
  },
  write_all_buffers = false,
  on_off_commands = true,
  clean_command_line_interval = 0,
  debounce_delay = 1000,
})
