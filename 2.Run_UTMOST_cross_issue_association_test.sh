#!/bin/bash
## Combine gene-trait associations in 49 tissues by joint GBJ test
"D:\mini\envs\UTMOST/python.exe" "D:/R-4.3.2/library/Fast2TWASsoft/bin/UTMOST/joint_GBJ_test.py" \
  --weight_db "E:/insomnia/03.reference/UTMOST/database_normalized_pruned/"  \
  --cov_dir "E:/insomnia/03.reference/UTMOST/covariance_joint_GTEx8_normalized_pruned"  \
  --output_dir "E:/insomnia/07.UTMOST/result/"  \
  --output_name "stroke_GTEXv8_49_cross"  \
  --input_folder "./result"  \
  --gene_info "./result/gene_info_GTExv8.txt"  \
  --start_gene_index 1  \
  --end_gene_index 22518
wait
echo 程序运行时间: $SECONDS秒
