-- utf8
vim.g.encoding = "UTF-8"
vim.opt.fileencoding = "utf-8"
-- jkhl 移动时光标周围保留8行
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"
-- 缩进4个空格等于一个Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
-- >> << 时移动长度
vim.opt.shiftwidth = 2

-- 空格替代tab
vim.opt.expandtab = true

-- 新行对齐当前行
vim.opt.autoindent = true
vim.bo.autoindent = true
vim.opt.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 搜索不要高亮
vim.opt.hlsearch = false
-- 边输入边搜索
vim.opt.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.opt.cmdheight = 1
-- 当文件被外部程序修改时，自动加载
vim.opt.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.opt.whichwrap = "<,>,[,]"
-- 允许隐藏被修改过的buffer
vim.opt.hidden = true
-- 鼠标支持
vim.opt.mouse = "a"
-- 禁止创建备份文件
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
-- 遇到问题详见：https://github.com/nshen/learn-neovim-lua/issues/1
vim.opt.timeoutlen = 500
-- split window 从下边和右边出现
vim.opt.splitbelow = true
vim.opt.splitright = true
-- 自动补全
vim.g.completeopt = "menu,noinsert,menuone"
-- 样式
vim.opt.termguicolors = true
-- 是否显示不可见字符
vim.opt.list = false
-- 不可见字符的显示，这里只把空格显示为一个点
vim.opt.listchars = "space:·,tab:··"
-- 补全增强
vim.opt.wildmenu = true

-- 补全最多显示10行
vim.opt.pumheight = 10
-- 永远显示 tabline
vim.opt.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.opt.showmode = false
-- 配置剪切板
vim.opt.clipboard = "unnamedplus"
vim.opt.foldtext = "v:lua.require('utils.simple_fold').simple_fold()"
vim.opt.foldlevelstart = 99

vim.opt.completeopt = { 'menuone', 'noselect' } -- 插入模式补全使用的选项
vim.opt.conceallevel = 0 -- ``在markdown文件中可见
vim.opt.hlsearch = true -- 高亮搜索结果

vim.opt.undofile = true -- 把撤销信息写入一个文件里
vim.opt.updatetime = 300 --  刷新交换文件所需的毫秒数(默认4000ms)
vim.opt.writebackup = false -- 如果一个文件正在被另一个程序编辑(或在另一个程序编辑时写入文件), 则不允许编辑
vim.opt.cursorline = true -- 高亮当前行
vim.opt.number = true -- 显示行号

vim.opt.numberwidth = 2 -- 行号宽度: 2
vim.opt.signcolumn = 'yes' -- 始终显示符号列，否则每次都会移动文本

vim.opt.laststatus = 3 -- global statusline
 vim.opt.statusline = "%!v:lua.require('ui.statusline').run()"

