#!/bin/bash
# 基于SNP，p-value数据的gene-based分析
"D:/R-4.3.2/library/Fast2TWASsoft/bin/Windows/magma.exe"  \
  --bfile "../03.reference/magma/g1000_eur/g1000_eur"  \
  --gene-annot "E:/insomnia/14.MAGMA/result/stroke_magma.genes.annot"  \
  --pval "../06.pre_data/stroke.txt"   use= 3,9  ncol= N  \
  --out "E:/insomnia/14.MAGMA/result/stroke_magma"

wait
echo 程序运行时间: $SECONDS秒
