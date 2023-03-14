export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dracula"
plugins=(
    git 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    z 
    sudo
    extract
)
source $ZSH/oh-my-zsh.sh
export JAVA_HOME=/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home
export PATH=/opt/go/bin:/Users/xsh/go:$JAVA_HOME/bin:/opt/homebrew/opt/openjdk/bin:$PATH
export HOMEBREW_BREW_GIT_REMOTE=https://mirrors.ustc.edu.cn/brew.git

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lll="ll $* | less -r"
alias lh='ls -lh'
alias ld='ls -ld'
alias l='ll'
alias v='vim'
alias bs='brew search'
alias bi='brew install'
alias bs='brew uninstall'