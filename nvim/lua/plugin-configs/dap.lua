
local status, dap = pcall(require, "dap")
if not status then
  vim.notify("dap not found!")
  return
end


local status, vt = pcall(require, "nvim-dap-virtual-text")
if not status then
  vim.notify("nvim-dap-virtual-text not found!")
  return
end
vt.setup({
  enabled = true,
  enable_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  filter_references_pattern = '<module',
  virt_text_pos = 'eol',
  all_frames = false,
  virt_lines = false,
  virt_text_win_col = nil
})

require('plugin-configs.dap.ui')


dap.set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog
dap.adapters.go = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/dlv',
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}
dap.configurations = {
    go = {
      {
        type = "go", -- Which adapter to use
        name = "Debug", -- Human readable name
        request = "launch", -- Whether to "launch" or "attach" to program
        program = "${file}", -- The buffer you are focused on when running nvim-dap
      },
    }
}

-- dap.adapters.go = {
--   type = 'executable';
--   command = 'node';
--   args = {os.getenv('HOME') .. '/vscode-go/dist/debugAdapter.js'};
-- }
-- dap.configurations.go = {
--   {
--     type = 'go';
--     name = 'Debug';
--     request = 'launch';
--     showLog = true;
--     program = "${workspaceFolder}",
--     dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
--   },
-- }
-- dap.configurations.go = {
--   {
--     type = "go",
--     name = "Debug Package",
--     request = "launch",
--     program = "${workspaceFolder}",
--   },
--   {
--     type = "go",
--     name = "Debug test", -- configuration for debugging test files
--     request = "launch",
--     mode = "test",
--     program = "${file}"
--   },
--   -- works with go.mod packages and sub packages
--   {
--     type = "go",
--     name = "Debug test (go.mod)",
--     request = "launch",
--     mode = "test",
--     program = "./${relativeFileDirname}"
--   }
-- }
