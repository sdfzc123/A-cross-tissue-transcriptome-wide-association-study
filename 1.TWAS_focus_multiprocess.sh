#!/bin/bash
[ -e /tmp/fd1 ] || mkfifo /tmp/fd1
exec 5<>/tmp/fd1
rm -rf /tmp/fd1
NUM=$1

for i in `seq ${NUM}`;do echo >&5;done

for i in $(seq 1   22 ); do
  read -u5
  {
  echo focus分析选中的染色体: $i

  "D:\mini\envs\FOCUS/python.exe" "D:/R-4.3.2/library/Fast2TWASsoft/bin/ma-focus/bin/focus" finemap \
  "./result/stroke.focus.sumstats.gz" \
  "../03.reference/FOCUS/1000G_EUR_Phase3_plink/1000G.EUR.QC.$i" \
  "../03.reference/FOCUS/focus_GTEx_V8_from_fusion_GTExv8.ALL.Brain_Hippocampus.db" \
  --chr $i \
  --plot \
  --locations "../03.reference/FOCUS/grch37.eur.loci - 副本.bed" \
  --p-threshold 5e-06 \
  --out "E:/stroke/18.FOCUS/result/stroke_GTExv8.ALL.Brain_Hippocampus_focus.chr$i"
  echo >&5
  }&
done
wait
echo 程序运行时间: $SECONDS秒
