#!/bin/bash

# Set Session Name
SESSION="main"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
	# Start New Session with our name
	tmux new-session -d -s $SESSION

	tmux send-keys ". ~/.bashrc" C-m
fi

tmux new-window -t 0 -n "temp0"
tmux send-keys -t "temp0" "cd uni/code/positnn/include/positnn" C-m
tmux rename-window -t "temp0" "positnn"

tmux new-window -t 1 -n "temp1"
tmux send-keys -t "temp1" "cd uni/code/fashion_mnist_lenet5" C-m
tmux rename-window -t "temp1" "project"

tmux new-window -t 2 -n "temp2"
tmux send-keys -t "temp2" "cd uni/code/fashion_mnist_lenet5/build" C-m
tmux send-keys -t "temp2" "export Torch_DIR=/home/graposo/Documents/deep-learning-posit/code/libtorch/share/cmake/Torch/" C-m
tmux send-keys -t "temp2" "scl enable devtoolset-7 bash" C-m
tmux rename-window -t "temp2" "build"

tmux new-window -t 3 -n "temp3"
tmux send-keys -t "temp3" "cd uni/logbook" C-m
tmux rename-window -t "temp3" "logbook"

tmux new-window -t 4 -n "temp4"
tmux send-keys -t "temp4" "cd uni/code/fashion_mnist_lenet5/plots" C-m
tmux send-keys -t "temp4" "export DISPLAY=$DISPLAY" C-m
tmux send-keys -t "temp4" "source activate plots" C-m
tmux rename-window -t "temp4" "plots"

tmux select-window -t 0

# Attach Session, on the Main window
tmux attach-session -t $SESSION
