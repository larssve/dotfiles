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
export PS1="\u \w \$(__git_ps1 '(%s) ') |> "

# Change theme
set_kitty_theme () {
  ln -s -f "$HOME/.config/kitty/kitty-themes/$1.conf" "$HOME/.config/kitty/theme.conf"
}

set_monitors () {
  xrandr --output DP-2 --primary --right-of DP-4 --output DP-4 --auto
}

# User specific aliases and functions
alias la="ls -la --color=auto"
alias ll="ls -l --color=auto"
alias vim="nvim"
alias ..="cd .."
alias light-theme="set_kitty_theme AtomOneLight"
alias dark-theme="set_kitty_theme Atom"

alias code="flatpak run com.vscodium.codium"
