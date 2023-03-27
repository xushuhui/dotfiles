
local status, mason = pcall(require, "mason")
if not status then
    vim.notify("没有找到 mason")
    return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason-lspconfig")
    return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 lspconfig")
    return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
    ensure_installed = {
        "lua_ls",
        -- "tsserver",
      
        -- "bashls",
       
        -- "dockerls",
        -- "emmet_ls",
        -- "html",
        -- "jsonls",
        -- "pyright",
        -- "rust_analyzer",
        -- "taplo",
        "yamlls",
        "gopls",
        -- "clangd",
        -- "cmake",
    },
})
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
   
    keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keymap('n', 'gd',  "<cmd>Telescope lsp_definitions<cr>", bufopts)
    keymap('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", bufopts)
    keymap('n', 'gr',"<cmd>Telescope lsp_references<cr>", bufopts)
    keymap('n', 'K', vim.lsp.buf.hover, bufopts)
    keymap('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
    keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap('n', 'gt', "<cmd>Telescope lsp_type_definitions<cr>", bufopts)
    keymap('n', 'rn', vim.lsp.buf.rename, bufopts)
    keymap('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    keymap('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
    end, bufopts)

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                })
            end,
        })
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspcfg = require("lspconfig")
lspcfg.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    ui = {
        completion = {
          usePlaceholders = true,
        },
      },
})



-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- local servers = {
--   sumneko_lua = require("lsp.language.lua"), -- lua/lsp/config/lua.lua
--   bashls = require("lsp.language.bash"),
--   pyright = require("lsp.language.pyright"),
--   html = require("lsp.language.html"),
--   cssls = require("lsp.language.css"),
--   emmet_ls = require("lsp.language.emmet"),
--   jsonls = require("lsp.language.json"),
--   tsserver = require("lsp.language.typescript"),
--   yamlls = require("lsp.language.yamlls"),
--   dockerls = require("lsp.language.docker"),
--   tailwindcss = require("lsp.language.tailwindcss"),
--   rust_analyzer = require("lsp.language.rust"),
--   taplo = require("lsp.language.taplo"), -- toml
--   gopls = require("lsp.language.gopls"),
--   remark_ls = require("lsp.language.markdown"),
--   clangd = require("lsp.language.clangd"),
--   cmake = require("lsp.language.cmake"),
-- }

-- for name, config in pairs(servers) do
--   if config ~= nil and type(config) == "table" then
--     -- 自定义初始化配置文件必须实现on_setup 方法
--     config.on_setup(lspconfig[name])
--   else
--     -- 使用默认参数
--     lspconfig[name].setup({})
--   end
-- end
