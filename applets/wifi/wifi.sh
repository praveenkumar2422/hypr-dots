radio_status=$(nmcli radio wifi)

if [[ "$radio_status" == "enabled" ]]; then
    echo ""
else 
    nmcli radio wifi on
fi

ssid=$(nmcli -t -f SSID device wifi list)

target_ssid=$(printf "${ssid}" | fuzzel --dmenu)
if nmcli -t -f NAME,TYPE connection show | grep -q "${target_ssid}"; then
    if nmcli connection up "$target_ssid"; then
        exit 0
    else
        passwd=$(fuzzel --dmenu --prompt-only "Enter the password " --password)
        echo "$passwd"
        if nmcli device wifi connect "$target_ssid" password "$passwd"; then
            exit 0
        else
            notify-send "Unable to connect to the network ${target_ssid}"
        fi
    fi
else
    passwd=$(fuzzel --dmenu --prompt-only "Enter the password " --password)
    if nmcli device wifi connect "$target_ssid" password "$passwd"; then
        exit 0
    else
        notify-send "Unable to connect to the network ${target_ssid}"
    fi
fi


# radio_status=$(nmcli radio wifi)
#
# if [[ "$radio_status" != "enabled" ]]; then
#     nmcli radio wifi on
# fi
#
# ssid=$(nmcli -t -f SSID device wifi list)
# target_ssid=$(printf "%s" "${ssid}" | fuzzel --dmenu)
#
# if nmcli -t -f NAME,TYPE connection show | grep -q "${target_ssid}"; then
#     if nmcli connection up "$target_ssid"; then
#         exit 0
#     else
#         passwd=$(fuzzel --dmenu --prompt-only "Enter the password" --password)
#         if nmcli device wifi connect "$target_ssid" password "$passwd"; then
#             exit 0
#         else
#             notify-send "Unable to connect to the network ${target_ssid}"
#         fi
#     fi
# else
#     passwd=$(fuzzel --dmenu --prompt-only "Enter the password" --password)
#     if nmcli device wifi connect "$target_ssid" password "$passwd"; then
#         exit 0
#     else
#         notify-send "Unable to connect to the network ${target_ssid}"
#     fi
# fi
#
