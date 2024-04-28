alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -lh'
alias ld='ls -ld'
alias l='ll'
alias v='nvim'
alias bs='brew search'
alias bi='brew install'
alias bu='brew uninstall'
alias cp='cp -r'
alias lg='lazygit'
alias gac='git add . && git commit -m'
alias gc='git commit -m'
alias ga='git add .'
alias gp='git push'
alias b='cd ~'
alias gfw='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias pg='ps aux | grep $1'

[ -f /usr/local/share/autojump/autojump.fish ]
function fish_prompt -d "Write out the prompt"
printf '%s%s%s> ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end
if status is-interactive
set -U fish_greeting

end
