#!/bin/bash
# 生成.focus.sumstats.gz格式文件
"D:\mini\envs\FOCUS/python.exe" "D:/R-4.3.2/library/Fast2TWASsoft/bin/ma-focus/bin/focus" munge \
   "../06.pre_data/stroke.txt" \
   --chunksize 500000 \
   --out "E:/stroke/18.FOCUS/result/stroke.focus"
wait
echo 程序运行时间: $SECONDS秒
