#!/usr/bin/env bash
module load jje/jjeutils jje/lastz
projpath=/jje/jje/repos/confirmA4
#wget -O $projpath/data/raw/A4.fa.gz ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/300/595/GCA_002300595.1_Dmel_A4_1.0/GCA_002300595.1_Dmel_A4_1.0_genomic.fna.gz
#wget -O $projpath/data/raw/ISO1.fa.gz ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/215/GCA_000001215.4_Release_6_plus_ISO1_MT/GCA_000001215.4_Release_6_plus_ISO1_MT_genomic.fna.gz
target=$projpath/data/raw/ISO1.fa.gz; query=$projpath/data/raw/A4.fa.gz
targetchr="AE014298.5"; querychr="CM008268.1"
pad=2000
tstart=$((20263992-$pad)); tend=$((20264093+$pad)); qstart=$((20110000-$pad)); qend=$((20112000+$pad))
lastz \
  <(zcat ${target})[$tstart..$tend,subset=<(echo $targetchr)] <(zcat ${query})[$start..$qend,subset=<(echo $querychr)] \
  --format=rdotplot \
> $projpath/data/processed/inv28.rdots
