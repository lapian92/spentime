#!/bin/bash

# Leemos el archivo y almacenamos cada línea en un array
IFS=$'\n' read -d '' -r -a lines < "$1"

# Inicializamos un array vacío para almacenar los tiempos por tarea
declare -A times_by_task

# Recorremos cada línea del archivo
for line in "${lines[@]}"; do
  # Separamos cada línea por la coma y almacenamos el tiempo, la tarea y el último valor en variables separadas
  IFS=',' read -r time task _ <<< "$line"

  # Si la tarea ya existe en el array de tiempos por tarea, sumamos el tiempo a la tarea
  if [[ ${times_by_task[$task]+_} ]]; then
    times_by_task[$task]=$(( ${times_by_task[$task]} + $time ))
  # Si la tarea no existe en el array, la inicializamos con el tiempo actual
  else
    times_by_task[$task]=$time
  fi
done

# Imprimimos los tiempos por tarea
for task in "${!times_by_task[@]}"; do
  echo "Tarea: $task - Tiempo total: ${times_by_task[$task]} minutos"
done
