
set -xg JAVA_HOME /opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home
set -xg PATH /opt/go/bin /Users/xsh/go $JAVA_HOME/bin /opt/homebrew/bin $PATH
set -xg HOMEBREW_BREW_GIT_REMOTE https://mirrors.ustc.edu.cn/brew.git

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


if status is-interactive
    # Commands to run in interactive sessions can go here
end
