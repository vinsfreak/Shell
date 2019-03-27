#!/usr/bin/env bash
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
 #Le indicamos que todas las minusculas que metamos por teclado las convierte en mayuscula pues no podemos decidir que mete el usuario pero si "traducirlo" a lo que queremos.
 #Hacer una traza se llama
 marca=`echo $marca | tr "[a-z]" " [A-Z]"`
 #echo -n MODELO:
 #read modelo
 #modelo=`echo $modelo | tr "[a-z]" " [A-Z]"`
 
 echo "LISTADO COCHES MARCA: " $marca
 #Aqui le indicamos que el separador es la almuadilla
 OIFS=$IFS
 IFS="#"
 existe='n'
 while read ma mo mat fec
    do
    #Buscamos la marca y la metemos en la variable
    #echo "Marca buscada-->" $marca "Marca leida-->" $ma
     if [ $marca == $ma ]
        then 
        echo "MODELO: " $mo
        echo "MATRICULA: " $mat
        echo "FECHA: " $fec
        echo "-----------------------------"
     fi
    #Recibe los datos de fichero en el done.
    done < ./coches.txt
    IFS=$OIFS
    if [ "$existe" == "n" ]
     then
      echo "No ha habido coches de esa marca en el aparcamiento"
    fi
    read x

}

#Funcion por fecha creamos los datos
function flistafecha(){
echo -n DIA:
 read dia
 correcto = 'n'
 
    while [ "$correcto" == "n" ]
        do
        echo -n DIA:
        read dia
        if [[ $dia -ge 1 && $dia -le 31 ]]
            then
                correcto='s'
        fi
        done
        
correcto='n'
    while [ "$correcto" == "n" ]
        do
        echo -n MES:
        read mes
        if [[ $mes -ge 1 && $mes -le 12 ]]
            then
                correcto='s'
        fi
        done  
        #No pone el 0 del formato date
        if [ $mes -lt 10 ]
        then
         mes="0"${mes}
         fi
#La vamos a montar en el formato que tiene nuestro programa.
echo -n "ANNO (con 4 digitos): "
read anno
fecha=${dia}"-"${mes}"-"${anno}
echo 
 echo -n MES:
 read mes
 echo -n ANNO:
 read anno

echo "Coches aparcados el dia " $fecha
 #Aqui le indicamos que el separador es la almuadilla
 OIFS=$IFS
 IFS="#"
 existe='n'
 while read ma mo mat fec
    do
  
     if [ $fecha == $fec ]
        then 
        echo "MARCA: " $ma
        echo "MODELO: " $mo
        echo "MATRICULA: " $mat
              echo "-----------------------------"
     fi
    #Recibe los datos de fichero en el done.
    done < ./coches.txt
    IFS=$OIFS
    if [ "$existe" == "n" ]
     then
      echo "No ha habido coches de esa marca en el aparcamiento"
    fi
    read x

}

#Un bucle, mientras la opción no sea 4, hace algo.
op=0

while [ ${op} -ne 4 ]
 do
op= `yad --list --title="ADMINISTRACION APARCAMIENTO: " --column="" --colum="" "1" "NUEVO DATO" "2" "LISTADO POR MARCA" "3" "LISTADO POR FECHA" "4" "SALIR DEL PROGRAMA" --center
 --width=250 --height=200`
 echo ${op}
 op=`echo ${op} | cut -f1 -d'|'`

  #echo "ADMINISTRACION APARCAMIENTO"
  #echo "1. Nuevo dato"
  #echo "2. Listado por marca"
  #echo "3. Listado por Fecha"
  #echo "4. Salir"
  #echo -n "Seleccione opción: "
  #read op
  
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
