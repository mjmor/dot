_ssh() 
{
    local cur prev opts config_files
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    if [ -e ~/.ssh/config ]; then
        config_files=$(ls ~/.ssh/config)
    fi
    if [ -d ~/.ssh/config.d/ ]; then
        config_files="$config_files $(ls ~/.ssh/config.d/*)"
    fi
    opts=$(grep '^Host' $config_files | grep -v '[?*]' | cut -d ' ' -f 2-)

    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}
complete -F _ssh ssh
