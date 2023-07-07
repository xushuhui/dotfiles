
  
  _G.keymap = function(mode, key, command, opts)
    if not (type(key) == "string") then
        return
      end
      if not (type(command) == "string") then
        return
      end
      opts = opts or {}
      local default_opts = {
        remap = false,
        silent = true,
      }
      vim.keymap.set(mode, key, command, vim.tbl_extend("force", default_opts, opts))
  end

  _G.bufmap = function(bufnr, mode, key, command)
    local options = { noremap = true, silent = true,buffer = bufnr }
    vim.keymap.set( mode, key, command, options)
  end


  _G.hasPlugin=function(plugin)
    return require("lazy.core.config").plugins[plugin] ~= nil
  end

  _G.setOpts=function(name)
    local plugin = require("lazy.core.config").plugins[name]
    if not plugin then
      return {}
    end
    local Plugin = require("lazy.core.plugin")
    return Plugin.values(plugin, "opts", false)
  end