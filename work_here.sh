#!/bin/bash

tmux rename-window -t 0 "positnn"
tmux send-keys -t "positnn" "cd uni/code/positnn/include/positnn" C-m

tmux new-window -n "project"
tmux send-keys -t "project" "cd uni/code/mnist_lenet5" C-m

tmux new-window -n "build"
tmux send-keys -t "build" "cd uni/code/mnist_lenet5/build" C-m
#tmux send-keys -t "build" "export TorchDIR='/home/graposo/uni/code/libtorch-linux'" C-m
#tmux send-keys -t "build" "scl enable devtoolset-7 bash" C-m

tmux new-window -n "logbook"
tmux send-keys -t "logbook" "cd uni/logbook" C-m

#tmux new-window -n "plots"
#tmux send-keys -t "plots" "cd uni/code/mnist/plots" C-m

tmux select-window -t 0
