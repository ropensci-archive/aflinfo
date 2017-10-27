#wrappers for data
get_afl_ladder_url <- function(){
  afl_ladder_url <- "https://afltables.com/afl/seas/ladders/laddersyby.html"
  return(afl_ladder_url)
}

load_afl_ladder <- function(){
  # This data came from "https://afltables.com/afl/seas/2017.html"
  load("Data/ladder.RData")
  return(ladder)
}

load_afl_matches <- function(){
  # This data came from "http://www.aussportsbetting.com/data/historical-afl-results-and-odds-data/'
  match_data = read.csv('Data/Matches.csv')
  return(match_data)
}

load_afl_betting <- function(){
  # This data came from "http://www.aussportsbetting.com/data/historical-afl-results-and-odds-data/'
  betting_data = read.csv('Data/Betting.csv')
  return(betting_data)
}
