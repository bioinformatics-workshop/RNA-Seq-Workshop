#!/usr/bin/env Rscript

### Clean up output from featurecount matrix

# Load libraries
library(tidyverse)
library(glue)

# Load data
data <- read_tsv("analysis/featurecounts/allsamples_featurecounts.txt", skip = 1, col_names = T)

# Data clean up
new_name <- str_extract(names(data)[endsWith(names(data), "bam")],
            "(?<=star/).*(?=_Aligned)")

names(data)[endsWith(names(data), "bam")] <- new_name

data <- data %>%
  select(-Chr, -Start, -End, -Strand, -Length)

write.csv(data, "analysis/featurecounts/count_matrix.csv", row.names = F, quote = F)
