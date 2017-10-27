# intuitive wrappers

# This data came from 'http://www.samlewis.me/2015/02/afl-stats-sql/'
read_afl_dbase <- function(){
  con = dbConnect(drv=RSQLite::SQLite(), dbname="Data/afl-stats.sqlite")
  return(con)
}

get_dbase_tables <- function(con){
  all_tables = dbListTables(con)
  return(all_tables)
}

get_afl_stats <- function(con){
  afl_stats = dbGetQuery(con,'select * from stats')
  return(afl_stats)
}

get_afl_games <- function(con){
  afl_games = dbGetQuery( con,'select * from games')
  return(afl_games)
}

get_afl_teams <- function(con){
  afl_teams = dbGetQuery(con,'select * from teams')
  return(afl_teams)
}
