vcf=$1
anno=$2
out=$3
cut -f1-5 $vcf | perl -lane '$_=~s/\t/\\t/g;print' > tmp
readarray -t a < tmp
for a in ${a[@]}; do grep -P $a $anno ;done > $out
rm tmp

