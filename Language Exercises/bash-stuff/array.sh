#!/bin/bash

ARRAY=('hello' 'there' general kenobi)
ELEMENTS=${#ARRAY[@]}
for ((i =0; i<$ELEMENTS;i++));
do
    echo ${ARRAY[$i]}
done
echo $ELEMENTS