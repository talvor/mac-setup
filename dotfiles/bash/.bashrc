# Load .bashrc files from ~/.bashrc.d/
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*.bashrc; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Load bash completions from ~/.bash_completion.d/
if [ -d ~/.bash_completion.d ]; then
    for completion in ~/.bash_completion.d/*.bash-completion; do
        if [ -f "$completion" ]; then
            . "$completion"
        fi
    done
fi
unset completion
