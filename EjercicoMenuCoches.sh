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
 
    while[ "$correcto" == "n"]
        do
        echo -n DIA:
        read dia
        if [[ $dia -ge 1 && $dia -le 31 ]]
            then
                correcto='s'
        fi
        done
        
correcto='n'
    while[ "$correcto" == "n"]
        do
        echo -n MES:
        read mes
        if [[ $mes -ga 1 && $mes -le 12 ]]
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
