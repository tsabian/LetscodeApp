#!/bin/sh

#  EncryptInfoPlist.sh
#  Bitz
#
#  Created by Tiago Almeida de Oliveira on 08/02/23.
#  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.

DEBUG_FILE_NAME="debug.xcconfig"
RELEASE_FILE_NAME="release.xcconfig"

SOURCE_PATH="${SRCROOT}/WeatherShared/Config/Source/"

ENVIRONMENTS=("Debug" "Release")
SOURCE_FILES=($DEBUG_FILE_NAME $RELEASE_FILE_NAME)
TARGET_FILES=("${SRCROOT}/WeatherShared/Config/weather-$DEBUG_FILE_NAME" "${SRCROOT}/WeatherShared/Config/weather-$RELEASE_FILE_NAME")

SALTS=(3232343930463936 3232343930463936)
KEYS=(3839464446314431384335464641454138394631343145373742323246314146 3839464446314431384335464641454138394631343145373742323246314146)
IVS=(44333236444345394434304439363542 44333236444345394434304439363542)

VARKEYS=("API_KEY")

clear

function read_xcconfig() {
    local path=$1
    xcconfig=$(cat "$path")
    echo "$xcconfig"
}

function get_value() {
    local configpath=$1
    local varkey=$2
    value=$(grep -w "$varkey" "$configpath" | awk -F " = " '{print $2}')
    echo $value
}

function encrypt() {
    local data=$1
    local key=$2
    local iv=$3
    local salt=$4

    encrypted=$(echo $data | openssl enc -e -aes-256-cbc -K $key -iv $iv -S $salt | base64)
    echo $encrypted
}

function decrypt() {
    local data=$1
    local key=$2
    local iv=$3
    local salt=$4

    decrypted=$(echo $data | openssl enc -d -aes-256-cbc -a -K $key -iv $iv -S $salt)
    echo $decrypted
}

function replace() {
    local configpath=$1
    local oldvalue=$2
    local newvalue=$3
    
    if [ ! -f $configpath ]; then
        echo "$configpath não existe"
        exit 1
    fi

    sed "s/$(echo $oldvalue | sed 's/\//\\\//g')/$(echo $newvalue | sed 's/\//\\\//g')/g" "$configpath" > "$configpath.temp" && mv "$configpath.temp" "$configpath"
}

function replace_all_values() {
    local sourcepath=$1
    local targetpath=$2
    local key=$3
    local iv=$4
    local salt=$5
    local replaceall=$6
    replaceall=${replaceall:-true}
    local readfile=$7
    readfile=${readfile:-false}
    local cancelled=false
    
    if [ ! -f $sourcepath ]; then
        echo "$sourcepath não existe"
        exit 1
    fi
    
    if [ ! -f $targetpath ]; then
        echo "$targetpath não existe"
        exit 1
    fi

    cp -f "$sourcepath" "$targetpath"

    echo "Inicio da criptografia do arquivo $targetpath"

    for i in "${!VARKEYS[@]}";
    do
        varkey=${VARKEYS[i]}
        value=$(get_value "$targetpath" "$varkey")
        encrypted=$(encrypt "$value" $key $iv $salt)

        if [ "$?" -ne "0" ]; then
            break
        fi

        if [ $replaceall == false ]; then
            while true; do
                echo "Deseja substituir o valor da variável \033[33m$varkey\033[0m de:"
                echo "\033[35m$value\033[0m"
                echo "para: "
                echo "\033[35m$encrypted\033[0m"
                echo "?"
                echo "\033[34m[Y] para subistituir | [A] para substituir todos | [C] para cancelar \033[0m"
                read answer

                if [[ "$answer" =~ ^[yYaA]$ ]]; then
                    if [ "$answer" == "A" ]; then
                        replaceall=true
                    fi

                    replace "$targetpath" "$value" "$encrypted"
                    break

                elif [[ "$answer" =~ ^[cC]$ ]]; then
                    cancelled=true
                    break

                fi
            done

        else
            replace "$targetpath" "$value" "$encrypted"

        fi

        if [ $cancelled == true ]; then
            break
        fi

        decrypted=$(decrypt "$encrypted" $key $iv $salt)
        if [ "$value" == "$decrypted" ]; then
            echo "\033[32m$varkey substituido\033[0m"
            echo "$varkey: $value -> $encrypted\n"

        else
            echo "\033[31m$varkey falhou\033[0m"
            echo "$value != $decrypted\n"

        fi

    done

    if [ $cancelled == true ]; then
        echo "Criptografia dos dados foi cancelada"
        exit 1
    fi

    echo "\n\n\033[31mCONFIRA TODOS OS DADOS ANTES DE SUBMETER AO REPOSITÓRIO\033[0m\n\n"

    if [ $readfile == true ]; then
        read_xcconfig $targetpath
    fi
}

INDEX=0
if [ "${APP_NAME}" = "Bitz.dev" ]; then
    INDEX=1
elif [ "${APP_NAME}" = "Bitz.hml" ]; then
    INDEX=2
elif [ "${APP_NAME}" = "Bitz.qa.hml" ]; then
    INDEX=3
elif [ "${APP_NAME}" = "Bitz" ]; then
    INDEX=4
fi

ENV=${ENVIRONMENTS[$INDEX]}
SOURCE=${SOURCE_FILES[$INDEX]}
TARGET=${TARGET_FILES[$INDEX]}
SALT=${SALTS[$INDEX]}
KEY=${KEYS[$INDEX]}
IV=${IVS[$INDEX]}

# replace_all_values "$SOURCE_PATH$SOURCE" "$TARGET" $KEY $IV $SALT
    
for i in "${!ENVIRONMENTS[@]}";
do
    ENV=${ENVIRONMENTS[i]}
    SOURCE=${SOURCE_FILES[i]}
    TARGET=${TARGET_FILES[i]}
    SALT=${SALTS[i]}
    KEY=${KEYS[i]}
    IV=${IVS[i]}

    echo "Encriptando o arquivo de configuração para o ambiente $ENV"

    replace_all_values "$SOURCE_PATH$SOURCE" "$TARGET" $KEY $IV $SALT

done
