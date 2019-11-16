#!/bin/bash

function mostrar_menu(){
    clear
    echo "1) Sucesion de Fibonacci según el numero ingresado"
    echo "2) Numero en forma invertida"
    echo "3) Palindromo"
    echo "4) Cantidad de lineas de un archivo"
    echo "5) Ordenar numeros"
    echo "6) Cuantos archivos de cada tipo"
    echo "7) Salir"
}

function fibonacci(){
	cantidad=$1
	aux=1
	aux2=1
	echo $aux
	if [ $1 -gt 1 ]
	then
		echo $aux2
	fi

	for((i=3;i<=cantidad;i++))
		do
			val=`expr $aux + $aux2`
			echo $val
			aux=$aux2
			aux2=$val
		done
}

function saludar(){
    NOMBRE=$1 
    echo "Chau $NOMBRE"
}

OPCION=0
mostrar_menu

while true; do
    read -p "Ingrese una opcion: " OPCION
    case $OPCION in
        1)
		NUM=0
		read -p "Ingrese un numero para ver la serie de Fibonacci: " NUM			
		fibonacci $NUM;;
		2)
			NUM=0
			read -p "Ingrese un numero entero: " NUM
			echo $NUM | rev ;;
		3)
		 read -p "Ingresar una cadena de caracteres: " cadena
		cadenaRev=`echo $cadena | rev`
		if [ $cadena = $cadenaRev ]
		then
			echo "Es un Palindromo"
		else
			echo "No es un Palindromo"
		fi;;
		4)
		read -p "Igrese el path de un archivo de texto: " path
		if [ -f $path ]
		then
			cantLin=`cat $path |wc -l`
			echo "El archivo tiene $cantLin lineas"
		else
			echo "La ruta ingresada no corresponde a un archivo"
		fi;;
		5)
			echo "Ingrese 5 numeros enteros: "
			for((i=1;i<=5;i++))
				do
					read -p "Numero $i: " numero$i
				done

			echo -e "$numero1\n$numero2\n$numero3\n$numero4\n$numero5" | sort -n ;; 

		6)
			echo "No me salio profe =(";;
        7)  saludar `whoami`
            break;;
	*) echo "Opcion incorrecta";;
    esac
done
exit 0
