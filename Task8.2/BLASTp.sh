#!/bin/bash

# 7.1
QUERY=unknow.fasta
DB=nr
blastp -db $DB -query $QUERY -remote -outfmt '6 qseqid sseqid pident length evalue bitscore stitle' -out BLASTp_results.txt
# Highest bitscore
cat BLASTp_results.txt | sort -n | head > BLASTp_results_sort_head.txt
# Lowest e-value
cat BLASTp_results.txt | sort -n | tail > BLASTp_results_sort_tail.txt
# Alignment higher than 122 bp
cat BLASTp_results.txt | sort -n | awk '$4 >= "122" { print }' > BLASTp_results_sort_awk.txt

# 7.2 






