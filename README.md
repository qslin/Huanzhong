## Workflow
### For Super mutants and SP60/66/132/138
#### 1. Filter SNPs (only homozygous SNPs with good mapping quality and coverage were remained)
> sh [filter.sh](https://github.com/qslin/Huanzhong/blob/master/filter.sh) /path/to/snp/file /path/to/genome/reference
#### 2. Compare homozygous SNPs among samples (all common SNPs were deleted)
> perl [QSBSA.pl](https://github.com/qslin/Bulk-Segregation-Analysis/blob/master/QSBSA.pl) -f=/SNPs/to/filter -v=/samples/to/compare -o=prefix
### For hvl mutant
#### 1. Filter hvl SNPs, Ler SNPs and hxlf2 SNPs (only SNPs with allele frequency > 50%, good mapping quality and coverage were remained)
> sh [hvl/filter.sh](https://github.com/qslin/Huanzhong/blob/master/hvl/filter.sh) /path/to/snp/file /path/to/genome/reference
#### 2. Compare SNPs among samples (all common SNPs were deleted)
> perl [QSBSA.pl](https://github.com/qslin/Bulk-Segregation-Analysis/blob/master/QSBSA.pl) -f=hvl/snp3.vcf -v=vcf_all.txt -o=hvl
#### 3. Count hxlf2 homozygous SNPs per 20kb sliding window 
> perl [QSBSA.pl](https://github.com/qslin/Bulk-Segregation-Analysis/blob/master/QSBSA.pl) -f=hxlf2/snp4.vcf -m=on -v=off -o=hxlf2


