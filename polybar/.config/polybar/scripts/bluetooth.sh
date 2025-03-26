#!/bin/bash

# Obtém o estado do Bluetooth
bluetooth_status() {
	if ! systemctl is-active --quiet bluetooth; then
		echo "󰂲" # Ícone de Bluetooth desligado
		exit
	fi
	echo "󰂯" # Ícone de Bluetooth ligado
}

# Alterna entre ligar e desligar o Bluetooth
toggle_bluetooth() {
	if systemctl is-active --quiet bluetooth; then
		systemctl stop bluetooth
	else
		systemctl start bluetooth
	fi
}

# Exibe um menu no Rofi com dispositivos Bluetooth
display_menu() {
	devices=$(bluetoothctl devices | awk '{print $2 " " substr($0, index($0,$3))}')
	options="Atualizar\nToggle Bluetooth\n$devices"
	choice=$(echo -e "$options" | rofi -dmenu -p "Bluetooth")

	case "$choice" in
	"Toggle Bluetooth")
		toggle_bluetooth
		;;
	"Atualizar")
		display_menu
		;;
	"")
		exit
		;;
	*)
		mac=$(echo "$choice" | awk '{print $1}')
		if bluetoothctl info "$mac" | grep -iq "conectado"; then
			bluetoothctl disconnect "$mac"
		else
			bluetoothctl connect "$mac"
		fi
		;;
	esac
}

display_menu
