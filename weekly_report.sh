#!/bin/bash

source_bills=~/Загрузки/Список.mxl.txt 
all_bills=~/Документы/all_bills

source_morev_report=


echo "" >> $all_bills
date >> $all_bills

# TODO for loop per every mng_name
echo Велинецкий | tee -a $all_bills
cat $source_bills | grep Велинецкий | wc -l | tee -a $all_bills
cat $source_bills | grep Велинецкий | sed  's/,.*//g' | sed 's/[^[:alnum:]]\+//g' | paste -sd+ - | bc | tee -a $all_bills
# needed?:
# printf '\n\n'

