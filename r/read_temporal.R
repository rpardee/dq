library(ggplot2)
library(lubridate)

setwd('C:/Users/pardre1/Documents/vdw/dq/')
rm(list=ls())

td <- read.table('data/temporal/dqcdm_temporal_summary_subset_2.txt', header=TRUE)

td$measure_id <- as.factor(td$measure_id)
td$concept_id <- as.factor(td$concept_id)
td$time_period <- ymd(paste(as.character(td$time_period), '15'))

# summary(opt[grep('flu', opt$concept_name), c('concept_name')])

opt <- td[td$source_name == "Optum",]
opt$source_name <- factor(opt$source_name)

opt_sub <- opt[opt$concept_name %in% c('Influenza with respiratory manifestation other than pneumonia', 'Type 1 diabetes mellitus', 'Rheumatoid arthritis', 'Morbid obesity'),]

opt_sub$concept_name <- factor(opt_sub$concept_name)
opt_sub$measure_id   <- factor(opt_sub$measure_id)
opt_sub$concept_id   <- factor(opt_sub$concept_id)

p <- ggplot(opt_sub, aes(time_period, prevalence))

p + geom_line() + facet_grid(concept_name ~ ., scales = "free_y")

# table(factor(opt[grep('flue', opt$concept_name), c('concept_name')]))
