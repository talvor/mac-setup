# ws - Workspace Selector
# Source the ws function and register shell completions
if [ -f "$HOME/.local/bin/ws" ]; then
    source "$HOME/.local/bin/ws"
elif [ -f "$HOME/bin/ws" ]; then
    source "$HOME/bin/ws"
fi
