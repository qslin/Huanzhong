## Workflow
### 1. Filter SNPs (only homozygous SNPs with good mapping quality and coverage were remained)
> sh [filter.sh](https://github.com/qslin/Huanzhong/blob/master/filter.sh) /path/to/snp/file /path/to/genome/reference
### 2. Compare SNPs among samples (all common SNPs were deleted)
> perl [QSBSA.pl](https://github.com/qslin/Bulk-Segregation-Analysis/blob/master/QSBSA.pl) -f=/SNPs/to/filter -v=/samples/to/compare -o=prefix

