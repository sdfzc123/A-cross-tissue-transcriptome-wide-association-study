#!/bin/bash
# gene-set-based分析
"D:/R-4.3.2/library/Fast2TWASsoft/bin/Windows/magma.exe"  \
  --gene-results "E:/insomnia/14.MAGMA/result/stroke_magma.genes.raw"  \
  --set-annot "../03.reference/magma/MSigDB_20231Hs_MAGMA.txt"  \
  --out "E:/insomnia/14.MAGMA/result/stroke_magma"

wait
echo 程序运行时间: $SECONDS秒
