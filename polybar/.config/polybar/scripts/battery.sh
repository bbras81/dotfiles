#!/bin/bash

# Obtém informações da bateria
capacity=$(cat /sys/class/power_supply/BATT/capacity)
status=$(cat /sys/class/power_supply/BATT/status)

# Define ícones com base no nível da bateria
if [ "$status" == "Charging" ]; then
  icon=""
elif [ "$capacity" -ge 90 ]; then
  icon=""
elif [ "$capacity" -ge 60 ]; then
  icon=""
elif [ "$capacity" -ge 40 ]; then
  icon=""
elif [ "$capacity" -ge 20 ]; then
  icon=""
else
  icon=""
fi

# Mostra o ícone e o nível da bateria
echo "$icon $capacity%"
