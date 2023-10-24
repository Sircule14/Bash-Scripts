#!/bin/bash

# Directorio donde se almacenarán los registros
registro_dir="/tu/ruta/CAMBIALA"
#CAMBIA ESTA LINEA CON TU DIRECTORIO

# Nombre del archivo de registro
registro_archivo="space_register_file.txt"

# Función para obtener la información del espacio en disco por partición
obtener_espacio_disco() {
  df -h | awk '{if (NR > 1) print $6,$4}'
}

# Verificar si el directorio de registros existe, si no, crearlo
if [ ! -d "$registro_dir" ]; then
  mkdir -p "$registro_dir"
fi

# Ruta completa al archivo de registro
registro_completo="$registro_dir/$registro_archivo"

# Obtener la información del espacio en disco
info_espacio_disco=$(obtener_espacio_disco)

# Obtener la fecha y hora actual
fecha_actual=$(date +"%Y-%m-%d %H:%M:%S")

# Guardar la información en el archivo de registro
echo "Registro de espacio en disco - $fecha_actual" >> "$registro_completo"
echo "$info_espacio_disco" >> "$registro_completo"
echo "-------------------------------------------" >> "$registro_completo"

# Calcular cambios en el espacio en disco desde el registro anterior (si existe)
if [ -f "$registro_completo" ]; then
  registro_anterior=$(tail -n 2 "$registro_completo" | head -n 1)
  espacio_anterior=$(echo "$registro_anterior" | awk '{gsub("G","",$2); print $2}')
  espacio_actual=$(echo "$info_espacio_disco" | awk '{gsub("G","",$2); print $2}')
  cambio_espacio=$(echo "$espacio_actual - $espacio_anterior" | bc)

  echo "Cambio de espacio en disco desde el registro anterior: $cambio_espacio GB" >> "$registro_completo"
fi


