# Locale
export LANG=en_US.UTF-8

# Homebrew
fish_add_path /opt/homebrew/bin

# Bobthefish theme settings
set -g theme_nerd_fonts no
set -g theme_powerline_fonts no

# Default editor
set -x EDITOR nvim
set -x VISUAL nvim

# Use lsd instead of ls
alias ls="lsd"
alias ll="lsd --long -h --group-dirs=first --git -A"
alias la="lsd -la"
alias lt="lsd --tree"

# Java
set -x JAVA_HOME /opt/homebrew/opt/openjdk@17
set -x PATH /opt/homebrew/opt/openjdk@17/bin $PATH
