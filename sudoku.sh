#!/bin/bash
 
clear
      
sudoku=()

generate_puzzle ()
{
if (($1 == 1))
then
	sudoku=(0 0 6 0 0 0 0 2 3
		0 0 4 0 3 2 0 8 0
		0 0 3 7 0 0 0 0 4 
		8 0 1 0 0 0 9 7 0 
		0 9 2 0 7 0 6 3 5 
		0 5 7 3 0 9 8 0 1
		1 0 9 0 0 0 0 5 0 
		0 0 5 0 0 0 0 6 9 
		3 0 0 0 9 0 0 0 0)  
elif (($1 == 2))
then
	sudoku=(5 0 3 4 0 2 9 0 7 
		6 0 2 0 0 9 0 3 0 
		0 7 8 0 1 0 2 6 0 
		8 0 0 0 0 0 0 7 0 
		1 0 0 0 5 7 0 4 0 
		0 0 5 1 0 0 0 9 0 
		2 0 9 7 8 3 4 1 6 
		3 6 1 0 9 4 7 0 8 
		4 0 7 6 0 1 3 5 9)   
elif (($1 == 3))
then
	sudoku=(3 0 6 5 0 8 4 0 0
		5 2 0 0 0 0 0 0 0
		0 8 7 0 0 0 0 3 1
		0 0 3 0 1 0 0 8 0
		9 0 0 8 6 3 0 0 5
		0 5 0 0 9 0 6 0 0 
		1 3 0 0 0 0 2 5 0
		0 0 0 0 0 0 0 7 4
		0 0 5 2 0 6 3 0 0)  
else
	sudoku=(0 0 6 0 0 0 0 2 3
		0 0 4 0 3 2 0 8 0
		0 0 3 7 0 0 0 0 4 
		8 0 1 0 0 0 9 7 0 
		0 9 2 0 7 0 6 3 5 
		0 5 7 3 0 9 8 0 1
		1 0 9 0 0 0 0 5 0 
		0 0 5 0 0 0 0 6 9 
		3 0 0 0 9 0 0 0 0)  
fi
	
}

COLOR_BLACK="\033[30m"    
COLOR_RED="\033[31m"
COLOR_GREEN="\033[32m"
COLOR_YELLOW="\033[33m"
COLOR_BLUE="\033[34m"
COLOR_MAGENTA="\033[35m"
COLOR_CYAN="\033[36m"
COLOR_DEFAULT="\033[37m"

LINE_GREEN="${COLOR_GREEN}|${COLOR_DEFAULT}"   
CROSS_GREEN="${COLOR_GREEN}+${COLOR_DEFAULT}"  

LAST_LINE=`tput lines`          
LAST_COL=`tput cols`            

CURSOR_X=0   
CURSOR_Y=0   

KEY=()       


if [ ! -n "$1" ]       
then
	LEVEL=1
else
	if [ $1 -lt 1 ]    
	then
		LEVEL=1
	elif [ $1 -gt 3 ]  
	then
		LEVEL=1
	else
		LEVEL=$1
	fi
fi

generate_puzzle $LEVEL

sudoku_buf=(${sudoku[*]})    

echo -e "   *******************************************"
echo -e "   *  ${COLOR_DEFAULT}-------------------------------------  *"
echo -e "   *  ${COLOR_DEFAULT}|   |   |   ${LINE_GREEN}   |   |   ${LINE_GREEN}   |   |   |  *"
echo -e "   *  ${COLOR_DEFAULT}|---+---+---${CROSS_GREEN}---+---+---${CROSS_GREEN}---+---+---|  *"
echo -e "   *  ${COLOR_DEFAULT}|   |   |   ${LINE_GREEN}   |   |   ${LINE_GREEN}   |   |   |  *"
echo -e "   *  ${COLOR_DEFAULT}|---+---+---${CROSS_GREEN}---+---+---${CROSS_GREEN}---+---+---|  *"
echo -e "   *  ${COLOR_DEFAULT}|   |   |   ${LINE_GREEN}   |   |   ${LINE_GREEN}   |   |   |  *"
echo -e "   *  |${COLOR_GREEN}---+---+---+---+---+---+---+---+---${COLOR_DEFAULT}|  *"
echo -e "   *  ${COLOR_DEFAULT}|   |   |   ${LINE_GREEN}   |   |   ${LINE_GREEN}   |   |   |  *    * * * * * * * * * * *"
echo -e "   *  ${COLOR_DEFAULT}|---+---+---${CROSS_GREEN}---+---+---${CROSS_GREEN}---+---+---|  *    *                   *"
echo -e "   *  ${COLOR_DEFAULT}|   |   |   ${LINE_GREEN}   |   |   ${LINE_GREEN}   |   |   |  *    * Level:    ${LEVEL}/3     *"
echo -e "   *  ${COLOR_DEFAULT}|---+---+---${CROSS_GREEN}---+---+---${CROSS_GREEN}---+---+---|  *    *                   *"
echo -e "   *  ${COLOR_DEFAULT}|   |   |   ${LINE_GREEN}   |   |   ${LINE_GREEN}   |   |   |  *    * * * * * * * * * * *"
echo -e "   *  |${COLOR_GREEN}---+---+---+---+---+---+---+---+---${COLOR_DEFAULT}|  *    *                   *"
echo -e "   *  ${COLOR_DEFAULT}|   |   |   ${LINE_GREEN}   |   |   ${LINE_GREEN}   |   |   |  *    * Timer:            *"
echo -e "   *  ${COLOR_DEFAULT}|---+---+---${CROSS_GREEN}---+---+---${CROSS_GREEN}---+---+---|  *    *                   *"
echo -e "   *  ${COLOR_DEFAULT}|   |   |   ${LINE_GREEN}   |   |   ${LINE_GREEN}   |   |   |  *    * * * * * * * * * * *"
echo -e "   *  ${COLOR_DEFAULT}|---+---+---${CROSS_GREEN}---+---+---${CROSS_GREEN}---+---+---|  *    *                   *"
echo -e "   *  ${COLOR_DEFAULT}|   |   |   ${LINE_GREEN}   |   |   ${LINE_GREEN}   |   |   |  *    *                   *"
echo -e "   *  ${COLOR_DEFAULT}-------------------------------------  *    * * * * * * * * * * *"
echo -e "   *******************************************"


echo -ne "\033[$((${LAST_LINE}));1H" 
echo -ne "\033[0m"
echo -ne "\033[7mPress f for finish or q for quit!\033[0m"


echo -ne "\033[3;9H"        
echo -ne "${COLOR_RED}"
for i in {0..8}
do
	for j in {0..8}
	do
		echo -ne "\033[$[ $i * 2 + 3 ];$[ $j * 4 + 9 ]H"   
		if [ ${sudoku[$[ $i * 9 + $j ]]} -ne 0 ]
		then
			echo -n "${sudoku[$[ $i * 9 + $j ]]}"
		fi
	done
done
echo -ne "${COLOR_DEFAULT}"
echo -ne "\033[3;9H"        

start=$(date "+%s")  

while :
do
	read -s -n 1 KEY
	case ${KEY[0]} in
		"A")           
			CURSOR_X=`expr ${CURSOR_X} - 1`
			if [ ${CURSOR_X} -lt 0 ]
			then
				CURSOR_X=8
				echo -ne "\033[16B"
			else
				echo -ne "\033[2A"
			fi
			;;
		"B")            
			CURSOR_X=`expr ${CURSOR_X} + 1`
			if [ ${CURSOR_X} -gt 8 ]
			then
				CURSOR_X=0
				echo -ne "\033[16A"
			else
				echo -ne "\033[2B"
			fi
			;;
		"C")            
			CURSOR_Y=`expr ${CURSOR_Y} + 1`
			if [ ${CURSOR_Y} -gt 8 ]
			then
				CURSOR_Y=0
				echo -ne "\033[32D"
			else
				echo -ne "\033[4C"
			fi
			;;
		"D")            
			CURSOR_Y=`expr ${CURSOR_Y} - 1`
			if [ ${CURSOR_Y} -lt 0 ]
			then
				CURSOR_Y=8
				echo -ne "\033[32C"
			else
				echo -ne "\033[4D"
			fi
			;;
		[0-9])         
			if [ ${sudoku[$[ ${CURSOR_X} * 9 + ${CURSOR_Y} ]]} -eq 0 ]
			then
				sudoku_buf[$[ ${CURSOR_X} * 9 + ${CURSOR_Y} ]]=${KEY[0]}
				if [ ${KEY[0]} -eq 0 ]
				then
					echo -n " "
				else
					echo -n "${KEY[0]}"
				fi
				echo -ne "\033[1D"
			fi
			;;
		"f")           
			source ./check.sh ${sudoku_buf[*]}
			if [[ $return_check -eq 0 ]]
			then
				tput sc      
				echo -ne "\033[19;54H"
				echo -ne "                "
				echo -ne "\033[19;54H"
				echo -ne "${COLOR_RED}    Failed${COLOR_DEFAULT}"
				tput rc      
			else
				tput sc      
				echo -ne "\033[19;54H"
				echo -ne "                "
				echo -ne "\033[19;54H"
				echo -ne "${COLOR_GREEN}Congratulations${COLOR_DEFAULT}"
				tput rc      
			fi
			;;
		"q")            
			echo -ne "\033[${LAST_LINE};1H"  
			echo -ne "\033[K"                 
			clear
			break
			;;
		*)              
			continue
			;;
	esac
	
	now=$(date "+%s")
	time=$((now-start))
	minute=$((time/60))
	second=$((time-minute*60))
	tput sc     
	echo -ne "\033[15;62H"
	echo -ne "        "
	echo -ne "\033[15;62H"
	echo -ne "${COLOR_DEFAULT}${minute}'${second}s${COLOR_DEFAULT}"
	tput rc      
done

