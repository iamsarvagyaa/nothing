# My minimal zsh prompt
# Author: Sarvagya Sagar

local PREFIX_GIT_PROMPT="%{$fg_bold[black]%} %{$fg[black]%}" 
local GIT_PROMPT_SUFFIX="%{$reset_color%}"
local GIT_PROMPT_DIRTY="%{$fg[red]%} ✗ "
local GIT_PROMPT_CLEAN="%{$fg[yellow]%} ✓ "
 
_gitprompt() {
    
    local IS_MASTER
    local IS_COMMIT
 
    IS_MASTER=$(git symbolic-ref --short HEAD 2>/dev/null) || return 0
    IS_COMMIT=$(git rev-parse --short HEAD 2>/dev/null) || return 0
 
    printf '%s%s@%s%s%s' "${PREFIX_GIT_PROMPT}" "${IS_MASTER}" "${IS_COMMIT}" "$(_dirtygit)" "${GIT_PROMPT_SUFFIX}"
    #printf ' %s%s%s   %s%s' "$(_dirtygit)" "${PREFIX_GIT_PROMPT}" "${IS_MASTER}" "${IS_COMMIT}" "${GIT_PROMPT_SUFFIX}"
}
 
_dirtygit() {
    
    local IS_DIRTY
    IS_DIRTY=$(git status --porcelain 2>/dev/null | tail -1)
 
    if [[ -n $IS_DIRTY ]]; then
        printf '%s' "$GIT_PROMPT_DIRTY"
    else
        printf '%s' "$GIT_PROMPT_CLEAN"
    fi
}
 
PROMPT="%(?.%{$fg_bold[green]%}%1/ ›.%{$fg_bold[red]%}%1/ ›)"
PROMPT+='%{$reset_color%}$(_gitprompt) '
#RPROMPT='%{$reset_color%}$(_gitprompt)'
