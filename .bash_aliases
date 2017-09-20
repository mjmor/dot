# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'

# my own alias'
alias shutdown='sudo shutdown now'
alias ..='cd ..'
alias apt-get='sudo apt-get'
alias apt='sudo apt'
alias c='clear'
alias h='history'

alias update='sudo apt-get update && sudo apt-get upgrade'
alias df='df -H'

#networking alias'
alias fping='ping -c 100 -s.2'
alias iptables='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptablesin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptablesout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptablesfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall='iptables'

# navigation
alias cd..='cd ..'
alias copy='xclip -selection clipboard'

# git
alias st='git status'

# vlc func
vlc_play () {
    /usr/bin/vlc --quiet "$1" >/dev/null 2>&1 &
}

# programs
alias chrome='google-chrome-stable >/dev/null 2>&1 &'
alias chromito='google-chrome-stable --incognito >/dev/null 2>&1 &'
alias vlc='vlc_play'
alias scan_wifi='sudo iw dev wlp3s0 scan | grep "SSID"'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# desktop specific for LED on keyboard
alias led_on="/usr/bin/xset led on"
alias led_off="/usr/bin/xset led off"

# vi to vim
alias vi="/usr/bin/vim"

# alias to common eecs directories
alias 482="cd /home/flounder/Documents/EECS482"
alias 485="cd /home/flounder/Documents/EECS485/IA"
alias 498="cd /home/flounder/Documents/EECS498"

google() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    xdg-open "https://www.google.com/search?q=$search"
}

youtube() {
    search=""
    echo "Youtube searching: $@"
    for term in $@; do
        search="$search%20$term"
    done
    xdg-open "https://www.youtube.com/results?search_query=$search"
}

alias chrome="google-chrome-stable"

alias vpn_status="sudo systemctl status openvpn-client@air-*"
