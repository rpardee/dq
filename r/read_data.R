# source('C:/Users/pardre1/documents/vdw/dq/r/read_data.R')

read_dqc <- function(rdir = 'C:/Users/pardre1/documents/vdw/dq/data', sdir = 'chco_dq') {


  # The Result table is the fact table, which contains the results of the summary statistics.
  # value, result_name, set_id, measure_id
  rpath = paste(rdir, sdir, 'result.csv'       , sep = '/')

  # Dimension Set table contains information about the dimension by which the data
  # in the Result table were aggregated.
  # set_id, dim_name_::X::, dim_value_::X:: x = 1 to 6
  dpath = paste(rdir, sdir, 'dimension_set.csv', sep = '/')

  # The Measure table contains meta-data of a measure.
  # measure_id, name, description, source_name
  mpath = paste(rdir, sdir, 'measure.csv'      , sep = '/')


  dimension = read.csv(dpath)
  dimension$set_id <- as.factor(dimension$set_id)

  measure   = read.csv(mpath)
  measure$measure_id <- as.factor(measure$measure_id)

  result    = read.csv(rpath)
  result$measure_id <- as.factor(result$measure_id)
  result$set_id     <- as.factor(result$set_id)

  return(list(dimensions=dimension, measures=measure, results=result))
}




