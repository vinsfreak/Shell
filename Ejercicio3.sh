#!usr/bin/env bash
#Vamos a mostrar los errores y demás con "YAD" a ver qeu tal.
if [$# -ne 2 ]
  then
  yad --info --title=error1 --text="Por favor introduzca dos palabras"
  width=200 --center 2>/tmp/null
else 
if [${1} == ${2}
  then
  yad --info --title=comparar --text="Las palabras son iguales"
  width=200 --center 2>/tmp/null
  
else
  yad --info --title=comparar --text="Las palabras son diferentes"
  width=200 --center 2>/tmp/nul
fi
fi
