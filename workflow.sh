#!/bin/bash

# Input VCF file
vcf_file="/data-shared/vcf_examples/luscinia_vars.vcf.gz"

# Output file for PHRED qualities
output_file="phred_qualities.txt"

# Step 1: Extract PHRED qualities from VCF using awk
zgrep -v '^#' $vcf_file | awk '{print $6}' > $output_file

# Step 2: Run R script for data analysis
Rscript data-analysis.R $output_file
