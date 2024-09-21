#!/bin/bash
# 生成.sumstats.gz格式文件
"D:\mini\envs\mesc_fast2twas/python.exe" "E:/stroke/mesc/mesc/run_mesc.py" \
   --h2med  "E:/stroke/10.FUSION/stroke.sumstats.gz" \
   --exp-chr  "E:/stroke/mesc/reference/Whole_Blood/Whole_Blood.@"  \
   --out "E:/stroke/mesc/result/stroke_Whole_Blood"

wait
echo 程序运行时间: $SECONDS秒
