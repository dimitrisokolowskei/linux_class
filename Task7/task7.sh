#!/bin/bash

REF=GCF_009858895.2
SAMPLE=GCA_009937905.1
TYPE=viral

# Download the Wuhan SARS-CoV-2 gene segments .fasta files 
ncbi-genome-download -A $REF -F cds-fasta --flat-output $TYPE
ncbi-genome-download -s genbank -A $SAMPLE -F cds-fasta --flat-output $TYPE
# Download the Wuhan SARS-CoV-2 genome .fasta files
ncbi-genome-download -A $REF -F fasta --flat-output $TYPE
ncbi-genome-download -s genbank -A $SAMPLE -F fasta --flat-output $TYPE
gunzip *.gz

# Selecting only the ORF8 gene segment 
seqkit grep --by-name --use-regexp --pattern "ORF8" GCF_009858895.2_ASM985889v3_cds_from_genomic.fna > ${REF}_orf8.fna
seqkit grep --by-name --use-regexp --pattern "orf8" GCA_009937905.1_ASM993790v1_cds_from_genomic.fna > ${SAMPLE}_orf8.fna

# Download the Wuhan SARS-CoV-2 protein segments .fasta files
epost -db protein -id YP_009724396.1 | efetch -format fasta > ${REF}_orf8.faa
epost -db protein -id QHO60600.1 | efetch -format fasta > ${SAMPLE}_orf8.faa

# ORF8 local and global alignment 
needle -asequence GCF_009858895.2_orf8.faa -bsequence GCA_009937905.1_orf8.faa -outfile pairwise_aln.needle
water -asequence GCF_009858895.2_orf8.fna -bsequence GCA_009937905.1_orf8.fna -outfile pairwise_aln.water

# Alignment between SARS-CoV-2 reference and US sample
matcher GCF_009858895.2_ASM985889v3_genomic.fna GCA_009937905.1_ASM993790v1_genomic.fna
# Differences between SARS-CoV-2 reference and US sample 
diffseq GCF_009858895.2_ASM985889v3_genomic.fna GCA_009937905.1_ASM993790v1_genomic.fna 
