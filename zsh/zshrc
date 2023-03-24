#Profiling
# zmodload zsh/zprof


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/gotoro/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall


# Remove percent at the end of print/cat
PROMPT_EOL_MARK=''


# Setup the git
autoload -Uz vcs_info
zstyle ':vcs_info:git*' 				enable git
zstyle ':vcs_info:git*' 				actionformats '%F{5} %f%F{14} 🢒%F{2}%b%F{14}|%F{1}%a%f'
zstyle ':vcs_info:git*' 				formats       '%F{5} %f%F{14} 🢒%F{2}%b%f %u%c'
zstyle ':vcs_info:(sv[nk]|bzr):*' 		branchformat  '%b%F{1}:%F{14}%r%f'
zstyle ':vcs_info:git*' 				check-for-changes true

# Creating custom prompt theme
prompt_pinktheme_setup() {
	vcs_info
	PROMPT="%F{5} %f %F{14}%1~%f %F{$((RANDOM % 255))}$%f "
	RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd prompt_pinktheme_setup
prompt_themes+=( pinktheme )
prompt pinktheme


# Autocompletions and stuff
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_MANUAL_REBIND="true"
source /usr/share/doc/pkgfile/command-not-found.zsh
# python venv
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh



# My functions
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do time $shell -i -c exit; done
}

# if cd'ed into a file, go back into that file's directory
cd() {
	if (( $+2 )); then
		builtin cd "$@"
		return 0
	fi

	if [ -f "$1" ]; then
		echo -e "$(print -P '       %1~' | sed 's/./ /g')⮩ ${1:h}${NC}" >&2
		builtin cd "${1:h}"
	else
		builtin cd "${@}"
	fi
}

len() {
	echo ${#1}
}

# use Wolfram Alpha's API to get an answer in the terminal
q() {
	old="$IFS"
	IFS="+"
	query="'$*'"
	curl "https://api.wolframalpha.com/v1/spoken?appid=KEY&i="$query
	IFS=$old
}

# open a file manager (dolphin) in this dir and disown it
here() {
	dolphin `pwd` &; disown
}

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo

typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
key[Control-Delete]="${terminfo[kDC5]}"

# setup key accordingly
[[ -n "${key[Home]}"           ]] && bindkey -- "${key[Home]}"           beginning-of-line
[[ -n "${key[End]}"            ]] && bindkey -- "${key[End]}"            end-of-line
[[ -n "${key[Insert]}"         ]] && bindkey -- "${key[Insert]}"         overwrite-mode
[[ -n "${key[Backspace]}"      ]] && bindkey -- "${key[Backspace]}"      backward-delete-char
[[ -n "${key[Delete]}"         ]] && bindkey -- "${key[Delete]}"         delete-char
[[ -n "${key[Up]}"             ]] && bindkey -- "${key[Up]}"             up-line-or-history
[[ -n "${key[Down]}"           ]] && bindkey -- "${key[Down]}"           down-line-or-history
[[ -n "${key[Left]}"           ]] && bindkey -- "${key[Left]}"           backward-char
[[ -n "${key[Right]}"          ]] && bindkey -- "${key[Right]}"          forward-char
[[ -n "${key[PageUp]}"         ]] && bindkey -- "${key[PageUp]}"         beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"       ]] && bindkey -- "${key[PageDown]}"       end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"      ]] && bindkey -- "${key[Shift-Tab]}"      reverse-menu-complete
[[ -n "${key[Control-Left]}"   ]] && bindkey -- "${key[Control-Left]}"   backward-word
[[ -n "${key[Control-Right]}"  ]] && bindkey -- "${key[Control-Right]}"  forward-word
[[ -n "${key[Control-Delete]}" ]] && bindkey -- "${key[Control-Delete]}" kill-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


# My aliases
alias sudo='sudo '
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
alias weather='curl wttr.in'
alias leaf='l3afpad'
alias zre='exec zsh'
alias code='vscodium'
alias grepi='grep -i'
alias cgrep='grep --color=always'
alias fsearch='find . -name '
alias cdp='cd ~/Projects/'
alias gputop='watch -d -n 0.5 nvidia-smi'
alias pingg='ping 8.8.8.8'
alias ccat='pygmentize -g'



# Running something on shell startup
print -P "If you are irritated by every rub, how will your mirror be polished?\n— %F{14}Rumi%f\n"
