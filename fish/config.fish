# pure theme
# 可以将原来的>修改成你喜欢的表情图案，比如我设置的是🏂
set --universal  pure_symbol_prompt 🏂
# 假如不喜欢上下行的方式，可以将命令行输入和当前文件夹放一行
set --universal pure_enable_single_line_prompt true
set --universal pure_show_subsecond_command_duration false
set --universal pure_threshold_command_duration 1000
set -xg https_proxy http://127.0.0.1:7890 
set -xg http_proxy http://127.0.0.1:7890
set -xg all_proxy socks5://127.0.0.1:7890
# path 
set -xg JAVA_HOME /opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home

set -xg PATH /opt/go/bin /Users/xsh/go $JAVA_HOME/bin /opt/homebrew/bin $PATH
set -xg HOMEBREW_BREW_GIT_REMOTE https://mirrors.us:lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>:lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>:lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>:lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>tc.edu.cn/brew.git

# alias 
alias ls='ls --color=auto'
alias la='ls -a'
alias g='git'
alias ll='ls -l'
alias lh='ls -lh'
alias ld='ls -ld'
alias l='ll'
alias v='nvim'
alias bs='brew search'
alias bi='brew install'
alias bs='brew uninstall'
alias cp='cp -r'
alias ga='git add .'
alias gm='git commit -m'
alias gp='git push'
alias b='cd ~'
if status is-interactive
    # Commands to run in interactive sessions can go here
end
