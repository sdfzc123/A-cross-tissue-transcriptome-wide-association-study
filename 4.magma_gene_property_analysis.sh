#!/bin/bash
# Gene property analysis for tissue specificity
"D:/R-4.3.2/library/Fast2TWASsoft/bin/Windows/magma.exe"  \
  --gene-results "./result/stroke_magma.genes.raw"  \
  --gene-covar "../03.reference/magma/gtex_v8_ts_avg_log2TPM.txt"  \
  --model direction-covar=positive condition-hide=Average  \
  --out "E:/insomnia/14.MAGMA/result/stroke_tissue_specific_magma_result"

wait
echo 程序运行时间: $SECONDS秒
