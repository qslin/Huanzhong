## Workflow
### For Super mutants
#### 1. Filter SNPs (only homozygous SNPs with good mapping quality and coverage were remained)
> sh [filter.sh](https://github.com/qslin/Huanzhong/blob/master/filter.sh) /path/to/snp/file /path/to/genome/reference
#### 2. Compare homozygous SNPs among samples (all common SNPs were deleted)
> perl [QSBSA.pl](https://github.com/qslin/Bulk-Segregation-Analysis/blob/master/QSBSA.pl) -f=/SNPs/to/filter -v=/samples/to/compare -o=prefix
### For hvl mutant
#### 1. Filter hvl SNPs and hxlf2 SNPs (only SNPs with allele frequency > 50%, good mapping quality and coverage were remained)
> sh [hvl_2/filter.sh](https://github.com/qslin/Huanzhong/blob/master/hvl_2/filter.sh) /path/to/snp/file /path/to/genome/reference
#### 2. Compare SNPs among samples (all common SNPs were deleted)
> perl [QSBSA.pl](https://github.com/qslin/Bulk-Segregation-Analysis/blob/master/QSBSA.pl) -f=/SNPs/to/filter -v=/samples/to/compare -o=prefix

