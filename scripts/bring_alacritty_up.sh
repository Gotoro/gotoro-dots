#!/bin/bash
# if we find exact match of alacritty, then bring it up
if pgrep -x "alacritty" > /dev/null
then
    echo "trying to use xdotool..."
    xdotool windowactivate $(xdotool search --onlyvisible --name alacritty)
# otherwise open new terminal window
else
    echo "starting alacritty"
    alacritty
fi
