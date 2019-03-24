#!/usr/bin/env bash
#1.	Realizar un programa de shell que reciba desde línea de órdenes tres palabras 
#y se encargue de mostrarlas por pantalla ordenadas alfabéticamente.


#Primero vamos a validar que hemos introducido 3 palabras, para ello usamos un "IF" para decirle que
#los valores introducidos en el prompt son 3

if [ $# -eq 3 ]
 then
    read palabra1 palabra2 palabra3
      echo $1>> temp.txt
      echo $2>> temp.txt
      echo $3>> temp.txt
      sort temp.txt
else
  echo Por favor, he pedido tres valores, introduzca el numero de valores correcto.

#Una vez que creamos el archivo hay que darle permisos de ejecución.
# chmod +x nombredelarchivo.sh
# ls -l nombredelarchivo.sh
# Nos muestra los permisos.

