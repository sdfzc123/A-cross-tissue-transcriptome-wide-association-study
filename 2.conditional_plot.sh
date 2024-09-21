#!/bin/bash
[ -e /tmp/fd1 ] || mkfifo /tmp/fd1
exec 5<>/tmp/fd1
rm -rf /tmp/fd1
NUM=$1

for i in `seq ${NUM}`;do echo >&5;done

for i in  2 4 ; do
  read -u5
  {
  echo TWAS中Joint/condation分析选中的染色体: $i

  "D:\R-43~1.2\bin\x64\Rscript.exe" "D:/R-4.3.2/library/friendlypostGWASsoft/bin/fusion_twas/FUSION.post_process.R" \
     --sumstats "../10.FUSION/stroke.sumstats.gz" \
     --input "../16.intersect_UTMOST_FUSION/stroke.GTExv8.ALL.Brain_Cortex.fusion_twas_symble_intersect_UTMOST_fusion_fdr.sig.txt" \
     --ref_ld_chr "../03.reference/FUSION/LDREF/1000G.EUR." \
     --chr $i \
     --save_loci \
     --plot \
     --report \
     --plot_legend all \
     --locus_win  5e+05 \
     --out "E:/stroke/17.Joint_conditional/result/Joint_condition_plot/stroke.chr.$i" \
     > "E:/stroke/17.Joint_conditional/log/stroke.conditional_plot.$i.log.txt"
  echo >&5
  }&
done
wait
echo 程序运行时间: $SECONDS秒
