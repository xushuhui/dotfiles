local present, ls = pcall(require, 'luasnip')

local types = require('luasnip.util.types')

if present then
  local options = {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { ' « ', 'NonTest' } },
        },
      },
    },
  }

  ls.config.set_config(options)

  require('luasnip.loaders.from_vscode').lazy_load({ paths = '~/.config/nvim/snippets' })
end

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.


-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet



-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)


vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/lua/plugin-configs/luasnip<CR>')
