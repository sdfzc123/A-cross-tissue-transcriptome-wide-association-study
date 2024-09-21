#!/bin/bash
# SNP注释步骤
"D:/R-4.3.2/library/Fast2TWASsoft/bin/Windows/magma.exe"  \
  --annotate \
  --snp-loc "../03.reference/magma/g1000_eur/g1000_eur.bim"  \
  --gene-loc "../03.reference/magma/NCBI37/ENSGv110.coding.genes.txt"  \
  --out "E:/insomnia/14.MAGMA/result/stroke_magma"

wait
echo 程序运行时间: $SECONDS秒
