return {
    {
        "folke/noice.nvim",
        config = function()
            require('plugin-configs.notice')
        end
    },
    { "MunifTanjim/nui.nvim", },
    -- nvim-notify
    {
        "rcarriga/nvim-notify",
        config = function()
            require('plugin-configs.nvimnotify')
        end,
    },
    {
        'akinsho/bufferline.nvim',
        event = { 'BufNewFile', 'BufRead', 'TabEnter' },
        config = function()
            require('plugin-configs.bufferline')
        end,
        init = function()
            require('keybinding').bufferline()
        end,
    },

    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        config = function()
            require('plugin-configs.alpha')
        end,
    },
    { 'nvim-lua/plenary.nvim',       lazy = true },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    
    { 'echasnovski/mini.statusline', version = false,config = function ()
        require('mini.statusline').setup({
              use_icons = true,
              set_vim_settings = true,
    })
    end },
   -- { 'echasnovski/mini.indentscope', version = false },
    
}
