#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Shahriyar variables
PREFIX="ʕ•́ᴥ•̀ʔっ"
SYMBOL_OPTIONS=("☪" "א" "Δ" "Ψ" "㋯" "Ж" )
SELECTED_SYMBOL=${SYMBOL_OPTIONS[$RANDOM % ${#SYMBOL_OPTIONS[@]}]}
FINAL_PROMPT="$PREFIX$SELECTED_SYMBOL"
# Shahriyars configs

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[36m\]\w\[\e[m\] \[\e[35m\]\n${FINAL_PROMPT} \[\e[m\] "
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=1;34;46:cd=1;34;43:su=1;30;41:sg=1;30;46:tw=1;30;42:ow=1;30;43"
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$PATH:/home/shahriyar/.local/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:/home/shahriyar/Games/ProjectIgnis"
export GOPATH=$(go env GOPATH)
export HKRC="~/.config/sxhkd/sxhkdrc"
export EDITOR="vim"


#export TERM="screen-256color"

#Aliases
ALIAS_PATH="$HOME/.config/bash/.aliases"
if [ -f $ALIAS_PATH ]; then
    source $ALIAS_PATH
else
    echo "could not find"
fi

. "$HOME/.cargo/env"
