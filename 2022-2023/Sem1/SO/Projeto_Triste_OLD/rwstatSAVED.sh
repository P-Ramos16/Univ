#!/bin/bash

# Usage message, only shows if the command has invalid arguments
usage() {
    echo "Usage: $0 [arguments] <num. seconds to analise>"
    echo "Arguments:"
    echo " -> [-c <process name/regex>]" 
    echo " -> [-s <start date>]" 
    echo " -> [-e <end date>]" 
    echo " -> [-u <user name/regex>]"
    echo " -> [-m <minimun PID>]" 
    echo " -> [-M <maximum PID>]" 
    echo " -> [-p <maximum table entries>]" 
    1>&2; exit 1;
}

function generateDataArr() {
    declare -n dataArray="$1"
    # Número de processos no array
    procIdsCatched=${#PIdArray[@]}

    # Generate array of Processes
    # for i = [0, 1, ..., procIdsCatched-1]
    for i in $(seq 0 $(( procIdsCatched - 1 ))); do
        procPId=${PIdArray[$i]}
        
        if [[ -f "/proc/${procPId}/io" ]]; then
            if [[ -r "/proc/${procPId}/io" ]]; then

                procRead=($(cat /proc/${procPId}/io | awk '$1 == "rchar:" { print $2 }') )
                procWrite=($(cat /proc/${procPId}/io | awk '$1 == "wchar:" { print $2 }'))

                if [[ $procRead -eq 0  ]] && [[ $procWrite -eq 0 ]]; then
                    continue
                fi

                procComm=($(cat /proc/${procPId}/comm))
                procUser=($(stat --format '%U' /proc/${procPId}))
                #procDate=($(ps -p ${procPId} -o lstart= | awk '{ print $2, $3, $4 }'))
                procDate=($(ls -ld /proc/${procPId} | awk '{ print $6, $7, $8 }'))

                procData[$maxProc, 0]=${procComm}
                procData[$maxProc, 1]=${procUser}
                procData[$maxProc, 2]=${procPId}
                procData[$maxProc, 3]=${procRead}
                procData[$maxProc, 4]=${procWrite}
                procData[$maxProc, 5]=${procRead}
                procData[$maxProc, 6]=${procWrite}
                procData[$maxProc, 7]=${procDate[@]}

                ((maxProc=maxProc+1))
            fi
        fi
    done

    return
}

function clearArray() {
    declare -n dataArray=$1
    declare -A tempArray
    local numProcs=$2
    local indexTemp="0"

    # for i = [0, 1, ..., numProcs-1]
    for i in $(seq 0 $(( numProcs - 1 ))); do
        # Ignorar as linhas que tenham rates Write/Read de 0
        if [[ -z "${dataArray[$i, 0]}" ]] || [[ "${dataArray[$i, 6]}" -eq 0 ]] || [[ "${dataArray[$i, 5]}" -eq 0 ]]; then 
            continue
        fi
        # Ignorar as linhas com PId que não estão no conjunto específicadp
        if [[ "${dataArray[$i, 2]}" -lt "$m" ]] || [[ "${dataArray[$i, 2]}" -gt "$M" ]]; then 
            continue
        fi
        
        dateProcess=$(date -d "${dataArray[$i, 7]}" +%s)
        dateStart=$(date -d "${s}" +%s)
        dateEnd=$(date -d "${e}" +%s)

        # Ignorar as linhas em que a data não está no conjunto específicado
        if [ $dateProcess -lt $dateStart ] || [ $dateProcess -gt $dateEnd ]; then 
            continue
        fi

        # Colocar a linha do dataArray no tempArray, agora que sabemos que esta é importante
        for ((n = 0; n < 8; n++)); do
            tempArray[$indexTemp, $n]="${dataArray[$i, $n]}"
        done
        ((indexTemp=indexTemp+1))
    done

    # Clone temporary array to procData
    unset procData
    declare -gA procData
    for key in "${!tempArray[@]}"; do
        procData[$key]=${tempArray[$key]}
    done
    maxProc=${indexTemp}

    return
}


function reReadWrite() {
    declare -n dataArray="$1"
    local numProcMax="$2"

    # Check for read/write every second
    for i in $(seq 0 $(( numProcMax - 1 ))); do
        procPId=${procData[$i, 2]}

        procRead=($(cat /proc/${procPId}/io | awk '$1 == "rchar:" { print $2 }') )
        procWrite=($(cat /proc/${procPId}/io | awk '$1 == "wchar:" { print $2 }') )
        #procReadBits=($(cat /proc/${procPId}/io | awk '$1 == "rchar:" { print $2 }'))
        #procWriteBits=($(cat /proc/${procPId}/io | awk '$1 == "wchar:" { print $2 }'))

        numRead="$(( procData[$i, 5] - procRead ))"
        numWrite="$(( procData[$i, 6] - procWrite ))"

        numMedioRead="$(( numRead / secs ))"
        numMedioWrite="$(( numWrite / secs ))"

        procData[$i, 3]=${numRead#-}
        procData[$i, 4]=${numWrite#-}
        procData[$i, 5]=${numMedioRead#-}
        procData[$i, 6]=${numMedioWrite#-}
    done

    return
}


function sortArray() {
    declare -n dataArray="$1"
    local numProcMax="$2"

    sortN=5
    if [ "$w" -eq 1 ]; then
        sortN=6
    fi

    # Sort Array
    for i in $(seq 0 $(( numProcMax - 1 ))); do
        for j in $(seq $i $(( numProcMax - 1 ))); do
            if [[ "${dataArray[$i, $sortN]}" -lt "${dataArray[$j, $sortN]}" ]]; then
                temp=("${dataArray[$i, 0]}" "${dataArray[$i, 1]}" "${dataArray[$i, 2]}" "${dataArray[$i, 3]}" "${dataArray[$i, 4]}" "${dataArray[$i, 5]}" "${dataArray[$i, 6]}" "${dataArray[$i, 7]}")
                for ((n = 0; n < 8; n++)); do
                    dataArray[$i, $n]=${dataArray[$j, $n]}
                    dataArray[$j, $n]=${temp[$n]}
                done
            fi
        done
    done

    return
}


# Função que imprime o array no formato de tabela
function printArray() {
    local nDisplayed=0 # Número de linhas já mostradas
    local start=0      # Número da linha inicial
    local increment=1      # Número da linha inicial
    declare -n local dataArray="$1"
    local end=$(( ${#dataArray[@]} / 8 )) # Número da linha final

    # Onde começar/acabar a tabela, definido por "-r"
    if [ "$r" -eq 1 ]; then
        start=$(( end - 1 ))
        end=0
        increment="-1"
    fi

    printf "%-25s %-20s %6s %13s %15s %15s %10s %20s\n" "COMM" "USER" "PID" "READB" "WRITEB" "RATER" "RATEW" "DATE"

    #for j in $(seq $start $end); do       # [ -z "${dataArray[$j, 0]}" ] ||
    for (( j = ${start} ; j != ${end} ; j = ${j} + ${increment} )); do

        # Se já tiverem sido mostradas o número de linhas pretendidas, não mostra mais
        if [ "$nDisplayed" -ge "$p" ]; then
            break
        fi

        printf "%-25s %-20s %6s %13s %15s %15s %10s %20s\n" "${dataArray[$j, 0]}" "${dataArray[$j, 1]}" "${dataArray[$j, 2]}" "${dataArray[$j, 3]}" "${dataArray[$j, 4]}" "${dataArray[$j, 5]}" "${dataArray[$j, 6]}" "${dataArray[$j, 7]}"

        ((nDisplayed=nDisplayed+1))
    done

    return
}

# ------------------------------------------
# ------------------_MAIN_------------------
# ------------------------------------------


# Default Values, podem ser sobreescritos pelo utilizador
c=".*"              # Regex para filtrar processos pelo seu COMM
s="Jan 1 00:00"     # Data mínima inicial dos processos
e="Dec 31 23:59"    # Data máxima inicial dos processos
u=".*"             # Regex para filtrar processos pelo seu USER
export m=0                 # PID mínimo dos processos
export M=100000            # PID máximo dos processos
export p=100               # Num máximo de processos a mostrar
export w=0
export r=0
lastArg="${@: -1}"

# Se nenhum argumento for utilizado, ou o ultimo argumento for inválido (segundos entre leituras)
if [[ "$#" -eq 0 ]] || [[ "${lastArg}" =~ '^[0-9]+$'  ]] || [[ "${lastArg}" -lt 1 ]] || [[ "${lastArg}" -gt 1000 ]]; then
    usage
else
    secs="${@: -1}"              # Tempo entre as duas leituras das taxas read/write
fi


# Get options from command    
while getopts ":c::s::e::u::m::M::p::wr" commArg; do
    case "${commArg}" in
        # Sort with process name regex
        c)
            c=${OPTARG}
            ;;
        # Sort with start date
        s)
            s=${OPTARG}
            (( ${#s} != 0 )) || usage
            ;;  
        # Sort with end date
        e)
            e=${OPTARG}
            (( ${#e} != 0 )) || usage
            ;;
        # Sort with user name regex
        u)
            u=${OPTARG}
            ;;
        # Sort with minimum PID
        m)
            m=${OPTARG}
            ((m > 0)) || usage
            ;;
        # Sort with maximum PID
        M)
            M=${OPTARG}
            ((M < 10000)) || usage
            ;;
        # Show only p entries
        p)
            p=${OPTARG}
            ((p > 0 || p < 1000)) || usage
            ;;
        # Sort with maximum PID
        w)
            w=1
            ;;    
        # Show only p entries
        r)
            r=1
            ;;
        # Show usage if an invalid option is used
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


#         ps com PID, etime, user, comm | ignorar os do root | ignorar cabeçalho | user and comm filtrados com regex   output só os PIDs selecionados
PIdArray=($(ps -Ao pid,etime,user,comm | grep -v root | tail -n +2 | awk -v userName="$u" -v comName="$c" '$4~comName && $3~userName { print $1 }' ))
#PIdArray=($(pgrep -P 1))


maxProc=0
declare -A procData

# Generates all the information possible from the PIds
generateDataArr procData

# Esperar o tempo especificado
sleep $secs

# Re-ler e fazer a média das taxas read/write
reReadWrite procData maxProc

# Remover as entradas do array que não innteressam
clearArray procData maxProc

# Ordenar o array
sortArray procData maxProc

# Apresentar o array na forma tabela
printArray procData

#declare -p procReads