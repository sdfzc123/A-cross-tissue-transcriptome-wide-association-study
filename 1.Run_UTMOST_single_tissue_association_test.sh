#!/bin/bash
# Run single tissue association test for 49 tissues
[ -e /tmp/fd1 ] || mkfifo /tmp/fd1
exec 5<>/tmp/fd1
rm -rf /tmp/fd1
NUM=$1

for i in `seq ${NUM}`;do echo >&5;done

TISSUE_GTEx=(Adipose_Subcutaneous Adipose_Visceral_Omentum Adrenal_Gland Artery_Aorta Artery_Coronary Artery_Tibial Brain_Amygdala Brain_Anterior_cingulate_cortex_BA24 Brain_Caudate_basal_ganglia Brain_Cerebellar_Hemisphere Brain_Cerebellum Brain_Cortex Brain_Frontal_Cortex_BA9 Brain_Hippocampus Brain_Hypothalamus Brain_Nucleus_accumbens_basal_ganglia Brain_Putamen_basal_ganglia Brain_Spinal_cord_cervical_c-1 Brain_Substantia_nigra Breast_Mammary_Tissue Cells_Cultured_fibroblasts Cells_EBV-transformed_lymphocytes Colon_Sigmoid Colon_Transverse Esophagus_Gastroesophageal_Junction Esophagus_Mucosa Esophagus_Muscularis Heart_Atrial_Appendage Heart_Left_Ventricle Kidney_Cortex Liver Lung Minor_Salivary_Gland Muscle_Skeletal Nerve_Tibial Ovary Pancreas Pituitary Prostate Skin_Not_Sun_Exposed_Suprapubic Skin_Sun_Exposed_Lower_leg Small_Intestine_Terminal_Ileum Spleen Stomach Testis Thyroid Uterus Vagina Whole_Blood)
for tissue in  ${TISSUE_GTEx[@]} ; do
  read -u5
  {
  echo 当前分析的组织: $tissue
  "D:\mini\envs\UTMOST/python.exe" "D:/R-4.3.2/library/Fast2TWASsoft/bin/UTMOST/single_tissue_association_test.py" \
  --model_db_path "../03.reference/UTMOST/database_normalized_pruned//${tissue}.db"  \
  --covariance "../03.reference/UTMOST/covariance_GTEx8_normalized_pruned//${tissue}.txt.gz"  \
  --gwas_folder "../06.pre_data"  \
  --gwas_file_pattern "stroke.txt"  \
  --snp_column SNP  \
  --effect_allele_column effect_allele  \
  --non_effect_allele_column other_allele  \
  --beta_column beta  \
  --pvalue_column pval  \
  --output_file "E:/insomnia/07.UTMOST/result/stroke_GTExv8_${tissue}.csv"
  echo >&5
  }&
done

wait

TISSUE_GTEx=(Adipose_Subcutaneous Adipose_Visceral_Omentum Adrenal_Gland Artery_Aorta Artery_Coronary Artery_Tibial Brain_Amygdala Brain_Anterior_cingulate_cortex_BA24 Brain_Caudate_basal_ganglia Brain_Cerebellar_Hemisphere Brain_Cerebellum Brain_Cortex Brain_Frontal_Cortex_BA9 Brain_Hippocampus Brain_Hypothalamus Brain_Nucleus_accumbens_basal_ganglia Brain_Putamen_basal_ganglia Brain_Spinal_cord_cervical_c-1 Brain_Substantia_nigra Breast_Mammary_Tissue Cells_Cultured_fibroblasts Cells_EBV-transformed_lymphocytes Colon_Sigmoid Colon_Transverse Esophagus_Gastroesophageal_Junction Esophagus_Mucosa Esophagus_Muscularis Heart_Atrial_Appendage Heart_Left_Ventricle Kidney_Cortex Liver Lung Minor_Salivary_Gland Muscle_Skeletal Nerve_Tibial Ovary Pancreas Pituitary Prostate Skin_Not_Sun_Exposed_Suprapubic Skin_Sun_Exposed_Lower_leg Small_Intestine_Terminal_Ileum Spleen Stomach Testis Thyroid Uterus Vagina Whole_Blood)
for tissue in  ${TISSUE_GTEx[@]} ; do
 cat  "E:/insomnia/07.UTMOST/result/stroke_GTExv8_${tissue}.csv" >> "E:/insomnia/07.UTMOST/result/temp.txt"
done
echo  gene_ensg > "E:/insomnia/07.UTMOST/result/gene_info_GTExv8.txt"
awk -F, '{ print $1 }' "E:/insomnia/07.UTMOST/result/temp.txt" | sort -n | uniq |grep -v gene >> "E:/insomnia/07.UTMOST/result/gene_info_GTExv8.txt"
rm  "E:/insomnia/07.UTMOST/result/temp.txt"

wait
echo 程序运行时间: $SECONDS秒
