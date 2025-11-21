options=" Performance\n Balanced\n Power Saver"
mode=$(powerprofilesctl get)

case "$mode" in 
    "performance")
        powermode=" Performance"
        ;;
    "balanced")
        powermode=" Balanced"
        ;;
    "power-saver")
        powermode=" Power Saver"
        ;;
    *)
        powermode=""
        ;;
esac

output=$(printf "${options}" | fuzzel --dmenu --lines 3 --placeholder="${powermode}" -p " ")

case "$output" in 
    " Performance") 
        powerprofilesctl set performance
        ;;
    " Balanced")
        powerprofilesctl set balanced
        ;;
    " Power Saver")
        powerprofilesctl set power-saver
        ;;
    *)
        ;;
esac
