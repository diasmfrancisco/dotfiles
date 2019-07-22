# set shell
set -g default-shell /bin/zsh

set -g default-terminal "screen-256color"

##############
## pearlzli ##
##############

# See https://github.com/pearlzli/

# DISABLED: Reset command key to C-o
# Since C-b is not acceptable -- Vim uses it
# The use of C-o follows FRBNY usage with Right Command Key
set-option -g prefix C-o
bind-key C-o last-window

# Reload config file with prefix + r
unbind r
bind r source-file ~/roles/dotfiles/tmux.conf \; display-message "Config reloaded..."

# Mouse support
# Version checking: http://stackoverflow.com/a/40030702/2756250
if-shell '[ $(echo "$(tmux -V | cut -d" " -f2) >= 2.1" | bc) -eq 1 ]' \
    'set -g mouse on' \
    'set -g mode-mouse on; set -g mouse-resize-pane on; set -g mouse-select-pane on; set -g mouse-select-window on'

# [CURRENTLY DISABLED] Rebind split window commands to prefix + h and prefix + v
# If version >= 1.9, need to specify to open in same directory
# if-shell '[ $(echo "$(tmux -V | cut -d" " -f2) >= 1.9" | bc) -eq 1 ]' \
#     'bind h split-window -h -c "#{pane_current_path}"; bind v split-window -c "#{pane_current_path}"' \
#     'bind h split-window -h; bind v split-window -v'

# ALTERNATIVELY: split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# DISABLED: Rebind resize window commands
bind C-u resize-pane -U 5
bind C-d resize-pane -D 5
bind C-l resize-pane -L 5
bind C-r resize-pane -R 5

# Pane history
set -g history-limit 50000

# DISABLED FOR NOW: Needed to prevent tmux yank from putting stray characters on screen
# https://github.com/tmux/tmux/issues/97
# set -s set-clipboard off

#######################
## OTHER SOL VI COPY ##
#######################
### https://www.reddit.com/r/vim/comments/7tt4ts/painless_copy_paste_between_tmux_vim_and_system/

bind -T copy-mode-vi 'v' send -X begin-selection
bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy" \; display-message "Copied to system clipboard..."

# [DISABLED] Vi copypaste mode
# set-window-option -g mode-keys vi
# if-shell "test '\( #{$TMUX_VERSION_MAJOR} -eq 2 -a #{$TMUX_VERSION_MINOR} -ge 4 \)'" 'bind-key -Tcopy-mode-vi v send -X begin-selection; bind-key -Tcopy-mode-vi y send -X copy-selection-and-cancel'
# if-shell '\( #{$TMUX_VERSION_MAJOR} -eq 2 -a #{$TMUX_VERSION_MINOR} -lt 4\) -o #{$TMUX_VERSION_MAJOR} -le 1' 'bind-key -t vi-copy v begin-selection; bind-key -t vi-copy y copy-selection'

############
## Others ##
############

# DISABLED: reload config without info notice
# bind r source ~/.tmux.conf

# new window with prompt
bind-key C command-prompt -p "Name of new window: " "new-window -n '%%'"

# use alt + arrow keys without prefix key to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# use shift + arrow keys to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window

# https://github.com/seebi/tmux-colors-solarized/blob/master/tmuxcolors-256.conf
set-option -g status-bg colour235 #base02
set-option -g status-fg colour136 #yellow
set-option -g status-attr default

# active window title colors
set-window-option -g window-status-current-fg colour166 #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

# Start numbering at 1
set -g base-index 1

# Allows for faster key repetition
set -s escape-time 0

# reload config
bind r source-file ~/roles/dotfiles/tmux.conf \; display-message "Config reloaded..."

# auto window rename
set-window-option -g automatic-rename

# color
set -g default-terminal "screen-256color"

# Rather than constraining window size to the maximum size of any client connected to the *session*, constrain window size to the maximum size of any client connected to *that window*. Much more reasonable.
setw -g aggressive-resize on

# Allows us to use C-o a <command> to send commands to a TMUX session inside another TMUX session
bind-key a send-prefix

# Activity monitoring
setw -g monitor-activity on
set -g visual-activity on

# DISABLED: hjkl pane traversal
# bind h select-pane -L
# bind j select-pane -D
# bind k select-pane -U
# bind l select-pane -R

# set to main-horizontal, 66% height for main pane
# bind m run-shell "~/.tmux/scripts/resize-adaptable.sh -l main-horizontal -p 66"

# Same thing for vetrical layouts
# bind M run-shell "~/.tmux/scripts/resize-adaptable.sh -l main-vertical -p 50"

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour green #green

# status bar
set -g status-interval 1
set -g status-justify centre # center align window list
set -g status-left-length 20
set -g status-right-length 140
set -g status-left '#[fg=green]#H #[fg=black]• #[fg=green,bright]#(uname -r | cut -c 1-6)#[default]'
set -g status-right '#[fg=green,bg=default,bright]#(tmux-mem-cpu-load) #[fg=red,dim,bg=default]#(uptime | cut -f 4-5 -d " " | cut -f 1 -d ",") #[fg=white,bg=default]%a%l:%M:%S %p#[default] #[fg=blue]%Y-%m-%d'

#############
## UNKNOWN ##
#############

# https://github.com/edkolev/dots/blob/master/tmux.conf
# Updates for tmux 1.9's current pane splitting paths.

# from powerline
run-shell "tmux set-environment -g TMUX_VERSION_MAJOR $(tmux -V | cut -d' ' -f2 | cut -d'.' -f1 | sed 's/[^0-9]*//g')"
run-shell "tmux set-environment -g TMUX_VERSION_MINOR $(tmux -V | cut -d' ' -f2 | cut -d'.' -f2 | sed 's/[^0-9]*//g')"

# status bar
if-shell '\( #{$TMUX_VERSION_MAJOR} -eq 2 -a #{$TMUX_VERSION_MINOR} -lt 2\) -o #{$TMUX_VERSION_MAJOR} -le 1' 'set-option -g status-utf8 on'

# rm mouse mode fail
if-shell '\( #{$TMUX_VERSION_MAJOR} -eq 2 -a #{$TMUX_VERSION_MINOR} -ge 1\)' 'set -g mouse off'
if-shell '\( #{$TMUX_VERSION_MAJOR} -eq 2 -a #{$TMUX_VERSION_MINOR} -lt 1\) -o #{$TMUX_VERSION_MAJOR} -le 1' 'set -g mode-mouse off'