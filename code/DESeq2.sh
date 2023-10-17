#!/bin/bash
#SBATCH --partition=batch
#SBATCH --cpus-per-task=16
#SBATCH --mem=100g
#SBATCH --time=0-8:00:00
#SBATCH --mail-type=ALL
#SBATCH --job-name="deseq2"
#SBATCH --output=log/%x_%j.log
##################################################################

####################
# Executing Rscript
# conda activate DEG-analysis
# Rscript --vanilla DESeq2.R
####################

# Load conda environment
source activate DEG-analysis

# Run R script
Rscript --vanilla code/DESeq2.R