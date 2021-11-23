#!/bin/bash

QUERY=unknow_gene.fasta
DB=nt
blastn -db $DB -query $QUERY -remote -out results.txt 
