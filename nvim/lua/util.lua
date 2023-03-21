
  
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

  _G.bufmap = function(bufnr, mode, key, command, opts)
    local options = { noremap = true, silent = true }
    if opts then
      options = skcode.merge(options, opts)
    end
    vim.api.nvim_buf_set_keymap(bufnr, mode, key, command, options)
  end
  