#!/usr/local/bin/zsh

tmux has-session -t sp 2>/dev/null

if [ "$?" -eq 1 ]; then
  tmux new -d -s sp -n code
  tmux new-window -t sp:8 -n grunt
  tmux new-window -t sp:9 -n node

  tmux send-keys -t sp:0 'sp; clear' C-m
  tmux send-keys -t sp:8 'spr; gulp dev:build' C-m
  tmux send-keys -t sp:9 'spr; cd ../web-backend; node app' C-m

  tmux select-window -t sp:0
fi

tmux a -t sp
