#!/bin/bash

QUERY=spike.fasta
DB=swissprot

# 7.2
wget https://ftp.ncbi.nlm.nih.gov/blast/db/swissprot.tar.gz
tar zxvf swissprot.tar.gz
blastx -query $QUERY -db $DB -negative_taxids 2697049 -outfmt 11 -out spike_nt_blastx.txt
blast_formatter -archive spike_nt_blastx.txt -outfmt 0 -out spike_nt_blastx.pairwise_alignment.txt
