# library("DBI")
# library("lubridate")
#
# # connect to the SQLite file
# con = dbConnect(drv=RSQLite::SQLite(), dbname="/Users/saundersk1/Documents/RUnconf/afl-stats.sqlite")
#
# # get a list of all tables
# alltables = dbListTables(con)
# afL_stats = dbGetQuery( con,'select * from stats')
# afl_games = dbGetQuery( con,'select * from games')
# afl_teams = dbGetQuery( con,'select * from teams')
#
# # get dates
# game_dates = sapply(afl_games$date,
#                function(x){
#                  str = strsplit(as.character(x), split = " ")[[1]][1]
#                  })
# game_dates = as.character(game_dates)
# game_dates = ymd(game_dates)
# game_year = year(game_dates)
#
# # get dates for a given year
# match_ind = which(game_year == 2010)
# unique(afl_games[match_ind, ]$round)
