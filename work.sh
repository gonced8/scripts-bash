#!/bin/bash

# Mount INESC home
#sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 inesc:/home/graposo /home/gonced8/Remote/INESC

# This
tmux rename-window -t 0 "this"

tmux new-window -n "inesc"
tmux send-keys -t "inesc" "ssh -XC inesc" C-m

#tmux select-window -t 0
