#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \w]\$ '

PATH="/home/cameron/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/cameron/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/cameron/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/cameron/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/cameron/perl5"; export PERL_MM_OPT;

# Alias list
alias clear='cd && clear && kitty +kitten icat --align left ~/dotfiles/Pictures/skeleton_cheezit.gif && ls'
alias update='sudo reflector --latest 5 --verbose --country US --sort rate --save /etc/pacman.d/mirrorlist --download-timeout 60; sudo pacman -Syu; paru; pacman -Qtdq | sudo pacman -Rns; sudo pacman -Scc'
alias neofetch='fastfetch'
# Changing "ls" to "exa"
alias ls='exa --icons --color=always --group-directories-first'
alias ll='exa -alF --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias l='exa -F --icons --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# Skeleton GIF & ls home directory when opening terminal
kitty +kitten icat --align left ~/dotfiles/Pictures/skeleton_cheezit.gif
ls ~/
