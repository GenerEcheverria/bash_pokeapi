#!/bin/bash
if [[ -z $1 ]]
  then
    echo "Debes ingresar un pokemon como parámetro"
  else 
    status=$(curl --write-out '%{http_code}' --silent --output /dev/null https://pokeapi.co/api/v2/pokemon/$1)
    if [[ "$status" -ne 200 ]] ; 
      then
        echo "Pokemon no encontrado"
      else
        curl -s https://pokeapi.co/api/v2/pokemon/$1 | 
        jq -jr '"id="+(.id|tostring), " name="+.name, " weight="+(.weight|tostring), " height="+(.height|tostring) , " order="+(.order|tostring) +"\n"' 
    fi
fi
