#!/bin/bash

# Set home folder in tmp
#TMP_HOME="/tmp/gecr"
#mkdir -p $TMP_HOME
TMP_HOME="$HOME"
cd $TMP_HOME

# Set Session Name
SESSION="main"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
	# Start New Session with our name
	tmux new-session -d -s $SESSION

	#tmux send-keys ". ~/.bashrc" C-m

	# Create windows
	tmux new-window -t 0
	tmux rename-window -t 0 "other"

	tmux new-window -t 1
	tmux rename-window -t 1 "edit"

	tmux new-window -t 2
	tmux rename-window -t 2 "run"

	tmux new-window -t 3
	tmux send-keys -t 3 "watch -n 1 'nvidia-smi | tail -n 50'" C-m
	tmux split-window -h
	tmux send-keys -t 3 "htop -u gecr" C-m
	tmux rename-window -t 3 "monitor"

	# Select initial window
	tmux select-window -t 0
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION
