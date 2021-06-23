#!/bin/bash

#for f in $(ls *.fastq.gz | sed 's/?_001.fastq.gz//' | sort -u)

for f in $(ls *.fastq.gz | while read F; do basename $F | rev | cut -c 15- | rev; done | sort | uniq)

    do  /home/hannah/anaconda3/bin/trimmomatic PE -phred33 ${f}1_001.fastq.gz ${f}2_001.fastq.gz  ${f}1_paired.fq.gz ${f}1_unpaired.fq.gz ${f}2_paired.fq.gz ${f}2_unpaired.fq.gz ILLUMINACLIP:adapters_AL.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

    echo "Reads paired together and being trimmed" ${f}1_001.fastq.gz ${f}2_001.fastq.gz


done


