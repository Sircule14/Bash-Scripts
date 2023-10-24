**INSTRUCCIONES**

- Descargar el archivo space_register.sh
- Editar achivo en nano, visual studio o editor.
**CAMBIAR LINEA 4 DEL ARCHIVO CON NUESTRO DIRECTORIO**


- Darle permiso al script para ejecutarse
chmod +x space_register.sh en el terminal


- Ejecutar archivo:
Escribir en terminal ./space_register.sh
Ahora en el directorio que especificamos en la linea 4 se 
guardara el archivo space_register.tx (puedes cambiar el nombre
editando la linea 8 del archivo)
Este archivo contendra detalles del espacio disponible y cambios
respecto al registro previo.



---
**PROGRAMAR REGISTRO**
Si quieres programar un registro por dia, semana etc puedes usar CRONTAB.

- Escribimos en terminal crontab -e
- Al final escribimos 0 2 * * 0 /ruta/al/script.sh (evidentemente despues del / deberemos especificar nuestra ruta a donde guardamos el script, para que crontab pueda programarlo
- Presionamos ctrl + o para guardar
- Presionamos ctrl + x para salir.

Listo, tarea programada

En este caso, lo estoy programando el domingo a las 2:00 am

En este link encontrara mas detalles de como programar tareas en crontab. https://geekflare.com/es/crontab-linux-with-real-time-examples-and-tools/

