##!/usr/bin/env bash
#Vamos a crear un menú y vamos a desarollar funciones.
#Funciones
function fnuevo(){
echo -n MARCA:
 read marca
echo -n MODELO:
 read modelo
echo -n MATRICULA:
 read matricula
echo -n FECHA:
fecha=`date "+%d-%m-%Y"`

    echo -e $marca"#"$modelo"#"$matricula"#"$fecha >>coches.txt
    if [ $? -eq 0 ]
#Comprobación de errores, si $?=0 está todo bien, si hubiera otra cosa hay un error.

#Lo que hacemos es como dá valores una condición para ello
        then
            valor=0
            
           
    else
            valor=1
            
    fi
    return $valor
}

#Aqui creamos la funcion lista.
function flistamarca(){
echo -n MARCA:
 read marca 
 echo "LISTADO COCHES MARCA: " $marca
 while read ma mo mat fec
    do
    #Buscamos la marca y la metemos en la variable
     if [ $marca == $ma ]
        then 
        echo "MODELO: " $mo
        echo "MATRICULA: " $mat
        echo "FECHA: " $fec
        echo "-----------------------------"
    #Recibe los datos de fichero en el done.
    done < ./coches.txt
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
    1) fnuevo
    #Lo que hacemos es como dá valores una condición para ello
    if [ $? -eq 0 ]
        then
             echo "Todo correcto, registro dado de alta"
        else
            echo "No se ha podido guardar nuevo registro"
    fi
    #Esto es una pausa lo pasamos a una variable que no vamos a usar.
    read x;;
    #DOlar interrogacion recibe el valor de el return
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