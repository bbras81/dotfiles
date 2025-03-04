#!/bin/bash

# Função para listar e conectar a redes Wi-Fi
wifi_menu() {
  # Lista as redes disponíveis
  networks=$(nmcli -t -f active,ssid dev wifi)
  #nmcli -f SSID,SIGNAL device wifi list
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
  current=$(nmcli -t -f active,ssid dev wifi | grep '^sim' | cut -d: -f2)
  echo "  $current"
fi
