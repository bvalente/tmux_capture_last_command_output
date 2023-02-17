#!/usr/bin/env bash

x=$(tmux capture-pane -p -S '-' -J -t !)
PROMPT_PATTERN=${PROMPT_PATTERN:-" ] % "}
result=$(echo "$x" | tac | gsed -e "0,/$PROMPT_PATTERN/d" | gsed "/$PROMPT_PATTERN/,\$d" | tac)

EDITOR_CMD=${EDITOR_CMD:-"$EDITOR -"}

echo "$result" | $EDITOR_CMD
