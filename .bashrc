# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# set prompt
source /usr/share/git-core/contrib/completion/git-prompt.sh
export PS1="\u \w \$(__git_ps1 '(%s) ')"

# User specific aliases and functions
alias la="ls -la --color=auto"
alias ll="ls -l --color=auto"
alias ..="cd .."
alias vim="nvim"

export GPG_TTY=$(tty)
. "$HOME/.cargo/env"
