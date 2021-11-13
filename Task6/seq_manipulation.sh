#!/bin/bash

REF=GCF_000240185.1
TYPE=bacteria

# 4.4.1
seqkit seq \
-m 1000 -M 2000 GCF_000240185.1_ASM24018v2_cds_from_genomic.fna | \
seqkit seq --complement --reverse --seq-type dna | seqkit translation --transl-table 11
# 4.4.2 (Tirar Dúvida)
seqkit shuffle GCF_000240185.1_ASM24018v2_cds_from_genomic.fna | seqkit head -n 10 > ${REF}_shuffled.fasta
# 4.4.3
seqkit grep -n -r -p "permease" GCF_000240185.1_ASM24018v2_cds_from_genomic.fna > permease_genes.fasta
# 4.4.4
seqkit stats permease_genes.fasta
# 4.4.5
seqkit sort -l GCF_000240185.1_ASM24018v2_cds_from_genomic.fna > ${REF}_sort_by_lenght.fasta
seqkit sort -n GCF_000240185.1_ASM24018v2_cds_from_genomic.fna > ${REF}_sort_by_name.fasta
seqkit sort -s GCF_000240185.1_ASM24018v2_cds_from_genomic.fna > ${REF}_sort_by_sequence.fasta
# 4.4.6
seqkit mutate -i 10:GGATC permease_genes.fasta
