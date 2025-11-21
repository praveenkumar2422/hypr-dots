options=" Lock\n Logout\n Sleep\n Shutdown\n Reboot\n Hibernate"
output=$(printf "${options}" | fuzzel --dmenu --lines 6)

lock=false
trap 'if $lock; then sleep 0.15; hyprlock; fi' EXIT

confirmation() {
    confirm=" Yes\n No"
    confirm_output=$(printf "$confirm" | fuzzel --dmenu --lines 2)

    case "$confirm_output" in 
        " Yes")
            eval "$2"
            ;;
        *)
            ;;
    esac

}

case "$output" in 
    " Lock") 
        lock=true
        exit 0
        ;;
    " Logout")
        confirmation "logout" "hyprctl dispatch exit"
        ;;
    " Sleep")
        systemctl suspend
        ;;
    " Shutdown")
        confirmation "shutdown" "systemctl poweroff"
        ;;
    " Reboot")
        confirmation "reboot" "systemctl reboot"
        ;;
    " Hibernate")
        confirmation "hibernate" "systemctl hibernate"
        ;;
    *)
        ;;
esac
