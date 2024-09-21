#!/bin/bash
[ -e /tmp/fd1 ] || mkfifo /tmp/fd1
exec 5<>/tmp/fd1
rm -rf /tmp/fd1
NUM=$1

for i in `seq ${NUM}`;do echo >&5;done

for i in $(seq 1   22 ); do
  for w in  GTExv8.ALL.Brain_Hippocampus ; do
  read -u5
  {
  echo TWAS分析选中的组织: $w;echo TWAS分析选中的染色体: $i

  "D:\R-43~1.2\bin\x64\Rscript.exe" "D:/R-4.3.2/library/friendlypostGWASsoft/bin/fusion_twas/FUSION.assoc_test.R" \
     --sumstats "stroke.sumstats.gz" \
     --weights "../03.reference/FUSION//$w.pos" \
     --weights_dir "../03.reference/FUSION//" \
     --ref_ld_chr "../03.reference/FUSION/LDREF/1000G.EUR." \
     --chr $i \
     --out "E:/insomnia/10.FUSION/result/Gene_disease_association/stroke.$w.$i.dat" \
     > "E:/insomnia/10.FUSION/log/stroke.$w.$i.twas.log.txt"
  echo >&5
  }&
  done
done
wait
echo  程序运行时间: $SECONDS秒
