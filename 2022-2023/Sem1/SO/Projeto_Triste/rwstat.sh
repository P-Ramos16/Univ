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

# Função que imprime o array no formato de tabela
function printArray() {
    local nDisplayed=1 # Número de linhas já mostradas
    local start=0      # Número da linha inicial
    local increment=1      # Número da linha inicial
    declare -n local dataArray="$1"
    local end=$(( ${#dataArray[@]} / 8 )) # Número da linha final

    printf "%-25s %-20s %6s %13s %15s %15s %10s %20s\n" "COMM" "USER" "PID" "READB" "WRITEB" "RATER" "RATEW" "DATE"

    # Onde começar/acabar a tabela, definido por "-r"
    if [ "$r" -eq 0 ]; then
        #for j in $(seq $start $end); do       # [ -z "${dataArray[$j, 0]}" ] ||
        for ((j = ${start} ; j < ${end} ; j = ${j} + ${increment})); do
            # Não mostrar linhas que tenham rates Write/Read de 0
            if [[ -z "${dataArray[$j, 0]}" ]] || [[ "${dataArray[$j, 6]}" -eq 0 ]] || [[ "${dataArray[$j, 5]}" -eq 0 ]] || [ "${dataArray[$j, 2]}" -lt "$m" ] || [ "${dataArray[$j, 2]}" -gt "$M" ]; then 
                continue
            fi
            # Se já tiverem sido mostradas o número de linhas pretendidas, não mostra mais
            if [ "$nDisplayed" -gt "$p" ]; then
                break
            fi

            ((nDisplayed=nDisplayed+1))
            printf "%-25s %-20s %6s %13s %15s %15s %10s %20s\n" "${dataArray[$j, 0]}" "${dataArray[$j, 1]}" "${dataArray[$j, 2]}" "${dataArray[$j, 3]}" "${dataArray[$j, 4]}" "${dataArray[$j, 5]}" "${dataArray[$j, 6]}" "${dataArray[$j, 7]}"

        done
        return
    fi

    start=${end}
    end=0
    increment="-1"
    #for j in $(seq $start $end); do       # [ -z "${dataArray[$j, 0]}" ] ||
    for ((j = ${start} ; j > ${end} ; j = ${j} + ${increment})); do
        # Não mostrar linhas que tenham rates Write/Read de 0
        if [[ -z "${dataArray[$j, 0]}" ]] || [[ "${dataArray[$j, 6]}" -eq 0 ]] || [[ "${dataArray[$j, 5]}" -eq 0 ]] || [ "${dataArray[$j, 2]}" -lt "$m" ] || [ "${dataArray[$j, 2]}" -gt "$M" ]; then 
            continue
        fi
        # Se já tiverem sido mostradas o número de linhas pretendidas, não mostra mais
        if [ "$nDisplayed" -gt "$p" ]; then
            break
        fi

        ((nDisplayed=nDisplayed+1))
        printf "%-25s %-20s %6s %13s %15s %15s %10s %20s\n" "${dataArray[$j, 0]}" "${dataArray[$j, 1]}" "${dataArray[$j, 2]}" "${dataArray[$j, 3]}" "${dataArray[$j, 4]}" "${dataArray[$j, 5]}" "${dataArray[$j, 6]}" "${dataArray[$j, 7]}"

    done
    return
}

function sortArray() {
    declare -n dataArray="$1"
    local numProcMax="$2"


    if [ "$w" -eq 0 ]; then
        # Sort Array
        for i in $(seq 1 $(( maxProc - 1 ))); do
            for j in $(seq $i $(( maxProc - 1 ))); do
                if [[ "${dataArray[$i, 5]}" -lt "${dataArray[$j, 5]}" ]]; then
                    temp=("${dataArray[$i, 0]}" "${dataArray[$i, 1]}" "${dataArray[$i, 2]}" "${dataArray[$i, 3]}" "${dataArray[$i, 4]}" "${dataArray[$i, 5]}" "${dataArray[$i, 6]}" "${dataArray[$i, 7]}")
                    for ((n = 0; n < 8; n++)); do
                        dataArray[$i, $n]=${dataArray[$j, $n]}
                        dataArray[$j, $n]=${temp[$n]}
                    done
                fi
            done
        done
        return
    fi

    for i in $(seq 1 $(( maxProc - 1 ))); do
        for j in $(seq $i $(( maxProc - 1 ))); do
            if [[ "${dataArray[$i, 6]}" -lt "${dataArray[$j, 6]}" ]]; then
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

function reReadWrite() {
    declare -n dataArray="$1"
    local numProcMax="$2"

    # Check for read/write every second
    for i in $(seq 1 $(( numProcMax - 1 ))); do
        procPId=${PIdArray[$i]}

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

# ------------------------------------------
# ------------------_MAIN_------------------
# ------------------------------------------


# Default Values, podem ser sobreescritos pelo utilizador
secs=2              # Tempo entre as duas leituras das taxas read/write
c=".*"              # Regex para filtrar processos pelo seu COMM
s="Jan 1 00:00"     # Data mínima inicial dos processos
e="Dez 31 24:00"    # Data máxima inicial dos processos
u="f.*"             # Regex para filtrar processos pelo seu USER
export m=0                 # PID mínimo dos processos
export M=100000            # PID máximo dos processos
export p=100               # Num máximo de processos a mostrar
export w=0
export r=0


# Get options from command    
while getopts ":c::s::e::u::m::M::p::wr" commArg; do
    case "${commArg}" in
        # Sort with Process Name
        c)
            c=${OPTARG}
            ;;

        # Sort with start date
        s)
            s=${OPTARG}
            ((-z s)) || usage
            ;;
    
        # Sort with end date
        e)
            e=${OPTARG}
            ((-z e)) || usage
            ;;

        # Sort with user
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
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))



#Array of PIDs alive for less than "secs"
#         ps com PID, etime, user, comm | ignorar os do root | ignorar cabeçalho | user and comm filtrados com regex   output só os PIDs selecionados
PIdArray=($(ps -Ao pid,etime,user,comm | grep -v root | tail -n +2 | awk -v userName="$u" -v comName="$c" '$4~comName && $3~userName { print $1 }' ))
#PIdArray=($(pgrep -P 1))


# Número de processos no array
maxProc=${#PIdArray[@]}
declare -A procData

# Generate array of Processes
# for i = [0, 1, ..., maxProc-1]
for i in $(seq 1 $(( maxProc - 1 ))); do
    procPId=${PIdArray[$i]}
    

    procRead=($(cat /proc/${procPId}/io | awk '$1 == "rchar:" { print $2 }'))
    procWrite=($(cat /proc/${procPId}/io | awk '$1 == "wchar:" { print $2 }'))

    if [ $procRead -eq 0  ] && [ $procWrite -eq 0 ]; then
        continue
    fi

    procComm=($(cat /proc/${procPId}/comm))
    procUser=($(stat --format '%U' /proc/${procPId}))
    procDate=($(ps -p ${procPId} -o lstart= | awk '{ print $2, $3, $4 }'))

    procData[$i, 0]=${procComm}
    procData[$i, 1]=${procUser}
    procData[$i, 2]=${procPId}
    procData[$i, 3]=${procRead}
    procData[$i, 4]=${procWrite}
    procData[$i, 5]=${procRead}
    procData[$i, 6]=${procWrite}
    procData[$i, 7]=${procDate[@]}

done

sleep $secs


reReadWrite procData maxProc

sortArray procData maxProc

printArray procData

#declare -p procReads