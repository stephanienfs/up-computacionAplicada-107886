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
    echo 
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
			cantidad=$NUM 
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
			
		2)
			NUM=0
			read -p "Ingrese un numero entero: " NUM
			echo $NUM | rev ;;
		5) 
			echo "Ingrese 5 numeros enteros: " 
			for((i=1;i<=5;i++))
				do
					read -p "Numero $i: " numero$i
				done
				
			echo -e "$numero1\n$numero2\n$numero3\n$numero4\n$numero5" | sort -n ;; 
			
		6)
			read -p "Ingrese un directorio: " path
			if [ -d $path ]
			then
				find $path -type f | sed -n 's/..*\.//p'  |sort |uniq -c
			else
				echo "El directorio no existe" 
			fi	;;
						
        7)  saludar `whoami`
            break;;
    esac
done
exit 0
