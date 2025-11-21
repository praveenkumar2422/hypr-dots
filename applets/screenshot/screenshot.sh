options=" Region\n Window\n Display"
selected=$(printf "${options}" | fuzzel --dmenu --lines 3 -p "󱣵 ")

case "$selected" in 
    " Region")
        hyprshot -m region
        ;;
    " Window")
        hyprshot -m window
        ;;
    " Display")
        hyprshot -m output
        ;;
    *)
        ;;
esac
