# Commands to run in interactive sessions can go here
if status is-interactive
    # No greeting
    set fish_greeting

    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != "linux"
        starship init fish | source
        enable_transience
    end
    
    # Colors
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Fastfetch (deferred to first prompt so terminal is fully initialized)
    function _print_fastfetch --on-event fish_prompt
        functions --erase _print_fastfetch
        if type -q fastfetch
            fastfetch
        end
    end

    # Aliases
    # kitty doesn't clear properly so we need to do this weird printing
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias pamcan pacman
    alias q 'qs -c ii'
    if test "$TERM" != "linux"
        alias ls 'eza --icons'
    end
    if test "$TERM" = "xterm-kitty"
        alias ssh 'kitten ssh'
    end


end


# opencode
fish_add_path /home/hustarico/.opencode/bin

set -x ANDROID_HOME $HOME/android-sdk
fish_add_path $ANDROID_HOME/platform-tools
set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk
