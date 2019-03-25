Hemos creado una máquina virtual libiana de Linux con la distribución Lubuntu.
Lo primero que hemos realizado es la actualización de la misma y puesta apunto de la máquina.

Así como la instalación de las guest additions de VBox para copiar y pergar de la máquina virtual a la real.

# sudo apt-get update
# sudo apt-get upgrade
Introducimos CD de las additions.
# alvaro@alvaro-pc:/media/alvaro/VBox_GAs_5.2.4$ sudo ./VBoxLinuxAdditions.run


Una vez realizado vamos a instalar Brackets como entorno de desarollo.


Brackets necesita la librería libgcrypt11 y Ubuntu no lo tiene en sus versiones más recientes.
Para resolver este problema, o bien instalamos la librería de manera independiente o bien utilizamos un repositorio estándar que solucione este problema. Personalmente opto por esto último y por el repositorio webupd8, un repositorio que cumple todas nuestras exigencias. Así que abrimos una terminal y escribimos lo siguiente:

# sudo add-apt-repository ppa:webupd8team/brackets
# sudo apt-get update
# sudo apt install brackets


A continuación vamos a instalar una serie de extensiones sencillas, puede que posteriormente
instalemos más.


#Brackets Icons
Pone iconos a los archivos.

#Lorem Ipsum Generator
Genera código Lorem Ipsum (texto de relleno)

#Beautify

HTML, CSS y JavaScript siempre bien formateado.
