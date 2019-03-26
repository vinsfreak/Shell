#!/usr/bin/env bash
#Vamos a crear un menú y vamos a desarollar funciones.
#Funciones
function fnuevo(){
    marca=$1
    modelo=$2
    matricula=$3
    fecha=$4
    echo -e $marca"#"$modelo"#"$matricula"#"$fecha"\n" >>coches.txt

}
#Un bucle, mientras la opción no sea 4, hace algo.
op=0
while [ ${op} -ne 4 ]
do
  echo "ADMINISTRACION APARCAMIENTO"
  echo "1. Nuevo dato"
  echo "2. Listado por marca"
  echo "3. Listado por Fecha"
  echo "4. Salir"
  echo -n "Seleccione opción: "
  read op
  
    case ${op} in
    #Mira uno por uno cual coincide con el valor 
    #Podemos indicarle patrones indicando las opciones..
    #Lo mas limpio es treabajar con funciones en los menús fnuevo.
    1) fnuevo fnuevo citroen A4 4051FGM 25-3-2019;;
    #Provamos si funciona el pasar parámetros
    2) flistamarca;;   #;; significa que no haga lo siguiente antes de aplicar la anterior.
    3) flistafecha;;
    esac
    
    #Podemos crear las funciones en cualquier punto pero lo suyo es #crearlas antes de llamarlas, es decir al principio.
done
#Una vez que creamos el archivo hay que darle permisos de ejecución.
# chmod +x nombredelarchivo.sh
# ls -l nombredelarchivo.sh
# Nos muestra los permisos.