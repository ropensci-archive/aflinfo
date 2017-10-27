get_afl_ladder <- function(){
  afl_ladder_url <- get_afl_ladder_url()
  raw_ladder <- read_html(afl_ladder_url)
  table_ladder <- html_table(raw_ladder)
  num_years = (length(table_ladder) - 1)
  table_ladder <- table_ladder[1:num_years] #remove the last table
  return(table_ladder)
}

