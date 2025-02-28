#!/bin/bash

# Função para listar e conectar a redes Wi-Fi
wifi_menu() {
  # Lista as redes disponíveis
  networks=$(nmcli -f SSID,SIGNAL device wifi list | tail -n +2 | sort -k2 -nr | awk '{print $1}')

  # Mostra um menu interativo (requer o rofi)
  choice=$(echo "$networks" | rofi -dmenu -p "Conectar Wi-Fi")

  if [ -n "$choice" ]; then
    nmcli device wifi connect "$choice" password $(rofi -dmenu -p "Senha:")
  fi
}

# Mostra a rede atual ou abre o menu
if [ "$1" == "menu" ]; then
  wifi_menu
else
  current=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
  echo " $current"
fi
