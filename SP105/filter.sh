module load bcftools

vcf=$1
ref=$2

snpcount0=`grep -c -v '^#' $vcf`
echo Before filtering: $snpcount0 SNPs

avg=`perl -lane 'if ($_=~/DP=(\d+);/) {print $1}' $vcf |sort -n|uniq -c|sort -nr|head -1|awk '{print $2}'`
covflt=`perl -sle 'print "(DP4[0]+DP4[1]+DP4[2]+DP4[3])<",$a/4,"||(DP4[0]+DP4[1]+DP4[2]+DP4[3])>",$a*4' -- -a=$avg`
bcftools filter -e $covflt $vcf  > snp1.vcf
echo Filter SNPs by coverage: $covflt
snpcount1=`grep -c -v '^#' snp1.vcf`
echo Round 1: $snpcount1 SNPs

bcftools norm -f $ref snp1.vcf -Ov -o snp2.vcf

frqflt="(DP4[2]+DP4[3])/(DP4[0]+DP4[1]+DP4[2]+DP4[3])<0.5"
bcftools filter -e $frqflt snp2.vcf | bcftools filter -e '%QUAL<200' | bcftools filter -e 'MQ<40' | bcftools filter -e 'MQSB<0.5' > snp3.vcf
awk '{split($10, a, ":");split(a[2], b, ",");if (b[1]>40&&b[2]>20&&b[3]==0) print}' snp3.vcf > snp4.vcf
grep '^#' snp3.vcf |cat - snp4.vcf > tmp
mv tmp snp4.vcf
echo Filter SNPs by homozygousity and mapping quality
snpcount3=`grep -c -v '^#' snp4.vcf`
echo Round 2: $snpcount3 SNPs

