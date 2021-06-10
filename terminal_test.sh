# terminal_test.sh

# creates a new terminal window
function new() {
    if [[ $# -eq 0 ]]; then
        open -a "Terminal" "$PWD"
    else
        open -a "Terminal" "$@"
    fi
}

new "sh farts.sh"