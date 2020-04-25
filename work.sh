#!/bin/bash

tmux rename-window -t 0 "positnn"
tmux send-keys -t "positnn" "cd uni/code/positnn/include/positnn" C-m

tmux new-window -n "project"
tmux send-keys -t "project" "cd uni/code/mnist" C-m

tmux new-window -n "build"
tmux send-keys -t "build" "cd uni/code/mnist/build" C-m

tmux new-window -n "logbook"
tmux send-keys -t "logbook" "cd uni/logbook" C-m

#tmux new-window -n "plots"
#tmux send-keys -t "plots" "cd uni/code/pytorch_regression/plots" C-m

tmux select-window -t 0
