require("noice").setup({
    

    signature = {
        enabled = false,
        auto_open = {
          enabled = false,
          trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
          luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
          throttle = 50, -- Debounce lsp signature help request by 50ms
        },
        view = nil, -- when nil, use defaults from documentation
      
        opts = {}, -- merged with defaults from documentation
      },
})