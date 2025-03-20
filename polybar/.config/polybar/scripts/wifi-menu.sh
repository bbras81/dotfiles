#!/bin/bash

wifi_menu() {
    # Obtém lista de redes únicas, ignorando cabeçalhos e redes vazias
    networks=$(nmcli -t -f SSID device wifi list | awk '!seen[$0]++' | sed '/^$/d')  
    choice=$(echo "$networks" | rofi -dmenu -p "Conectar Wi-Fi")  

    if [ -n "$choice" ]; then  # Se escolheu uma rede
        if nmcli -t -f NAME connection show | grep -Fxq "$choice"; then
            nmcli connection up "$choice" && notify-send "Wi-Fi" "Conectado a $choice"
        else
            password=$(rofi -dmenu -p "Senha para $choice" -password)
            if [ -n "$password" ]; then
                nmcli device wifi connect "$choice" password "$password" && notify-send "Wi-Fi" "Conectado a $choice"
            else
                notify-send "Wi-Fi" "Senha não fornecida. Conexão cancelada."
            fi
        fi
    fi
}

# Mostra a rede atual ou abre o menu
if [ "$1" == "menu" ]; then
    wifi_menu
else
    current=$(nmcli -t -f active,ssid dev wifi | grep '^sim' | cut -d: -f2)
    echo "  ${current:-Desconectado}"
fi
