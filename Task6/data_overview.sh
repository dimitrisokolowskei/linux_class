#!/bin/bash

REF=GCF_000240185.1
TYPE=bacteria


# 4.2.1
seqkit stat GCF_000240185.1_ASM24018v2_cds_from_genomic.fna
# 4.2.2/3 
seqkit head GCF_000240185.1_ASM24018v2_cds_from_genomic.fna
seqkit head GCF_000240185.1_ASM24018v2_cds_from_genomic.fna >> ${REF}_first_10_N.fasta
