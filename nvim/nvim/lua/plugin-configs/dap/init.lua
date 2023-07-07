local status, dap = pcall(require, "dap")
if not status then
  return
end

local status, dapui = pcall(require, "dapui")
if not status then
  return
end

local status, vt = pcall(require, "nvim-dap-virtual-text")
if not status then
  return
end
vt.setup({
  commented = true,
})
require('plugin-configs.dap.config')
require('plugin-configs.dap.ui')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', "--check-go-version=false", '-l', '127.0.0.1:${port}' },
  }
}
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    mode = "debug",
    request = "launch",
    program = "${workspaceFolder}"
  },


  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}
