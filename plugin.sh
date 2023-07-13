#!/usr/bin/env bash

x=$(tmux capture-pane -p -S '-' -J -t !)
PROMPT_PATTERN=${PROMPT_PATTERN:-" ] % "}
# tac inverts the text upside down
# sed select everything from the second line (skip current prompt) until the next prompt inclusive
# tac to invert back
result=$(echo "$x" | tac | gsed -n "2,/$PROMPT_PATTERN/p" | tac)

EDITOR_CMD=${EDITOR_CMD:-"$EDITOR -"}

echo "$result" | $EDITOR_CMD
