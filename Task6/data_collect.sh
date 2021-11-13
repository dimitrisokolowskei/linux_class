#!/bin/bash

REF=GCF_000240185.1
TYPE=bacteria

# 4.1.1
ncbi-genome-download -A $REF -F fasta --flat-output $TYPE
# 4.1.2
ncbi-genome-download -A $REF -F cds-fasta --flat-output $TYPE
ncbi-genome-download -A $REF -F protein-fasta --flat-output $TYPE
# 4.1.3
ncbi-genome-download -A $REF -F genbank --flat-output $TYPE
ncbi-genome-download -A $REF -F gff --flat-output $TYPE
gunzip *cds*
