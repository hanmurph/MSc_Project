#!/bin/bash




for f in $(ls *.fq.gz | while read F; do basename ${F} | rev | cut -c 15- | rev; done | sort | uniq)
do


echo "Processing sample" ${f}


salmon quant -i mouse_index -l A \
         -1 ${f}1_paired.fq.gz \
         -2 ${f}2_paired.fq.gz \
         -p 8 --validateMappings -o quants/${f}_quant


done 
