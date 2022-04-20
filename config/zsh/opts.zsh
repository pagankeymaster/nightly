YTFZF_CONFIG_DIR="$XDG_CONFIG_HOME/ytfzf"
YTFZF_CONFIG_FILE="$YTFZF_CONFIG_DIR/conf.sh"

umask 022
zmodload zsh/zle
zmodload zsh/zpty

autoload _vi_search_fix
zle -N _vi_search_fix
zle -N _sudo_command_line

# adapted from https://is.gd/RRNqsV
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':autocomplete:*' default-context ''
zstyle ':autocomplete:*' min-delay 0.05
zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' ignored-input ''
zstyle ':autocomplete:*' list-lines 16
zstyle ':autocomplete:history-search:*' list-lines 16
zstyle ':autocomplete:history-incremental-search-*:*' list-lines 16
zstyle ':autocomplete:*' recent-dirs cdr
zstyle ':autocomplete:*' insert-unambiguous no
zstyle ':autocomplete:*' widget-style complete-word
zstyle ':autocomplete:*' fzf-completion no
zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands

HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$color8,bold"

setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_SLASH
setopt COMPLETE_IN_WORD
setopt NO_MENU_COMPLETE
setopt HASH_LIST_ALL
setopt ALWAYS_TO_END

setopt NOTIFY
setopt NOHUP
setopt MAILWARN

setopt INTERACTIVE_COMMENTS
setopt NOBEEP

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# vim:ft=zsh:nowrap