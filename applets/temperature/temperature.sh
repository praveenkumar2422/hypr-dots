options=" Default\n 4500 \n 3500 "
output=$(printf "${options}" | fuzzel --dmenu --lines 3 )

case "$output" in 
    " Default")
        hyprctl hyprsunset identity
        ;;
    " 4500 ")
        hyprctl hyprsunset temperature 4500
        ;;
    " 3500 ")
        hyprctl hyprsunset temperature 3500
        ;;
    *)
        ;;
esac
