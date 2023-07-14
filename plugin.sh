#!/usr/bin/env bash

x=$(tmux capture-pane -p -S '-' -J -t !)
PROMPT_PATTERN=${PROMPT_PATTERN:-" ] % "}
# tac inverts the text upside down
# sed select everything from the second line (skip current prompt) until the next prompt inclusive
# sed to remove the right hand prompt
# tac to invert back
result=$(echo "$x" | tac | gsed -n "2,/$PROMPT_PATTERN/p" | gsed -e "1 s/\([0-9]\{1,3\}\)m \(git:(.*)\)\{0,1\}$//"| tac)

EDITOR_CMD=${EDITOR_CMD:-"$EDITOR -"}

echo "$result" | $EDITOR_CMD
