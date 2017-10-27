# # afl ladder data
# library(rvest)
#
# # data range
# start_year = 1897
# end_year = 2017
# year = 2017
#
# # read ladder data from websites
# afl_ladder_url <- "https://afltables.com/afl/seas/ladders/laddersyby.html"
# raw_ladder <- read_html(afl_ladder_url)
# table_ladder <- html_table(raw_ladder)
# num_years = (length(table_ladder) - 1)
# table_ladder <- table_ladder[1:num_years] #remove the last table
#
# # get the ladder for a given year
# year_ind = end_year - year + 1
# ladder <- table_ladder[year_ind][[1]]
# num_rounds = ncol(ladder) - 1
# names(ladder) = NULL
#
# # get match stats
# match_data = read.csv('Data/Matches.csv')
# betting_data = read.csv('Data/Betting.csv')
#
# # match dates
# match_dates = as.character(matches$Date)
# match_lubridates = dmy(match_dates)
# match_day = day(match_lubridates)
# match_month = month(match_lubridates)
# match_year = year(match_lubridates)
#
# # get matches for a given year
# all_matches = match_data[match_year == year, ]
# all_matches = all_matches[nrow(all_matches):1, ]
# play_offs = all_matches$Play.Off.Game. == "Y"
# finals = all_matches[play_offs == T, ]
# matches = all_matches[play_offs == F, ]
#
# # # get round data (didn't work)
# # team_names = unique(as.character(matches$Home.Team))
# # team_freq = rep(0, length(team_names))
# # num_matches = nrow(matches)
# # round_var = rep(1, num_matches)
# # round_count = 1
# # team_cols = which(names(matches) %in% c("Home.Team", "Away.Team") == 1)
# # for(i in 1:num_matches){
# #   home_team = as.character(matches$Home.Team[i])
# #   away_team = as.character(matches$Away.Team[i])
# #   team_ind = team_names %in% c(home_team, away_team)
# #   team_freq = team_freq + team_ind
# #   max_freq = max(team_freq)
# #   if(max_freq > round_count){
# #     round_count = round_count + 1
# #   }
# #   round_var[i] = round_count
# # }
#
# # team_name = "Sydney"
# # tempWrapper <- function(team_name, matches){
# #   team_ind = which(as.character(matches$Home.Team) == team_name |
# #         as.character(matches$Away.Team) == team_name)
# #   team_rounds = matches[team_ind, ]
# #   date_lubri = dmy(team_rounds$Date)
# #   diff_dates = abs(diff(date_lubri))
# #   bye_round = which.max(diff_dates)
# #   return(bye_round)
# # }
# # byes = sapply(team_names, tempWrapper, matches = matches)
#
# # # ------------------------
# # group_team <- matches %>%
# #   group_by(Home.Team) %>%
# #
# # x <- matches %>%
#
# #   mutate()
# #
# # teamA <- filter(matches, Home.Team == "West Coast")
# #
# # View(teamA)
#
#
#
# # -----------------------------------------------------------------------------
#
# # get match winners
# home_winners = matches$Home.Score > matches$Away.Score
# away_winners = matches$Home.Score < matches$Away.Score
#
# # home vs away wins
# prob_home_win = sum(home_winners)/length(home_winners)
# prob_away_win = sum(away_winners)/length(away_winners)
# prob_draw = 1 - prob_home_win - prob_away_win
