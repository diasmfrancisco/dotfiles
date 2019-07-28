# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/fmcdg/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/fmcdg/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/fmcdg/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/fmcdg/.fzf/shell/key-bindings.bash"
