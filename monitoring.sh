#!/bin/bash

log_info() {
  echo "$(date) - $1" >> script.log
}

get_cpu_info() {
  echo "Info for CPU"
  lspu
  echo "========================="
}

get_mem_info() {
  echo "Info for memory"
  free -h
  echo "========================="
}

get_network_info() {
  echo "Info for network"
  ip addr
  echo "========================"
}

error_handler() {
  echo "An error occurred: &1" 1>&2
  exit 1
}

trap 'error_handler "An error occured in the line $LINED" ' ERR


get_cpu_info  error_handler "Не удалось получить информацию о CPU"
get_mem_info  error_handler "Не удалось получить информацию о памяти"
get_disk_info  error_handler "Не удалось получить информацию о диске"
get_network_info  error_handler "Не удалось получить информацию о сети"
