#!/bin/bash
curl -s https://pokeapi.co/api/v2/pokemon/$1 | 
jq -jr '"id="+(.id|tostring), " name="+.name, " weight="+(.weight|tostring), " height="+(.height|tostring) , " order="+(.order|tostring) +"\n"' 
