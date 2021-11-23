#!/bin/bash

# Coronavirus Genomes ID's Array
ARRAY=("MN908947.3 MG772933.1 NC_004718.3 MN988669.1 MN988668.1 MN994467.1 KX574227.1 MF598691.1 MN985325.1")
TYPE=viral

for i in $ARRAY;
do
ncbi-genome-download -A $i -F fasta --flat-output $TYPE
done

#mafft --auto multi_samples.faa > multi_samples_alignment.fasta
#mafft --auto --clustalout multi_samples.faa > multi_samples_alignment.clustal

