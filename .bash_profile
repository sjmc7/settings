[[ -s ~/.bashrc ]] && source ~/.bashrc

. ~/.git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\u@\w" "\\\$ "'

. ~/.git-completion.bash

_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh
eval "$(pyenv init -)"

# The next line enables completion for kubectl
source $(brew --prefix)/etc/bash_completion
source <(kubectl completion bash)
