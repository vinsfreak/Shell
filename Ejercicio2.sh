#!/usr/bin/env bash
#2.	Igual que el anterior, pero leyendo las tres palabras de forma interactiva
#(desde el programa shell).

if [ $# -eq 3 ]
 then
    read palabra1 palabra2 palabra3
      echo $1>> temp.txt
      echo $2>> temp.txt
      echo $3>> temp.txt
      sort temp.txt
else
  echo Por favor, he pedido tres valores, introduzca el numero de valores correcto.
