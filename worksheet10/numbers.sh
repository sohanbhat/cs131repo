#!/bin/bash
#Author: Sohan B.

awk -F'\t' '
BEGIN{
	high=0;
	total=0;
}
NR>1{
	if(NR==2) low=$9; 
	else if($9>high) high=$9; 
	else if($9<low) low=$9;
	total+=$9
}
END{
	print "min " low, "max " high, "average " total/NR;
}' amazon_reviews_us_Books_v1_02.tsv 
