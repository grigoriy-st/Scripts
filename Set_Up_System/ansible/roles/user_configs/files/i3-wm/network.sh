#!/bin/bash

# Получение информации о скорости сети
# RX=$(cat /sys/class/net/enp4s0/statistics/rx_bytes)
# TX=$(cat /sys/class/net/enp4s0/statistics/tx_bytes)

# Интерфейс сети
INTERFACE="enp4s0"

# Запуск ifstat для отображения скорости
echo ifstat -i $INTERFACE 1

# Вычисление скорости
# (Здесь вы можете добавить логику для вычисления скорости)
# echo "RX: $RX bytes, TX: $TX bytes"
