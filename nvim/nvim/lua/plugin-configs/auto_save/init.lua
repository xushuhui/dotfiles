local present, autoSave = pcall(require, "auto-save")
if not present then
  vim.notify("AutoSave not found!")
  return
end

autoSave.setup({
  enabled = true,
  execution_message = {
    message = function() -- message to print on save
      return "";
    end,
  },

  events = { "InsertLeave", "TextChanged" },
  conditions = {
    exists = true,
    filename_is_not = {  },
    filetype_is_not = {},
    modifiable = true,
  },
  write_all_buffers = false,
  on_off_commands = true,
  clean_command_line_interval = 0,
  debounce_delay = 1000,
})
