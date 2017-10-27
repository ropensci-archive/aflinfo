dbase_con = read_afl_dbase()

# read in the afl database
afl_tables = get_dbase_tables(dbase_con)
afl_stats = get_afl_stats(dbase_con)
afl_games = get_afl_games(dbase_con)
afl_teams = get_afl_teams(dbase_con)

# add score to stats
afl_stats = afl_stats %>%
  mutate(goal_score = ifelse(is.na(goals_kicked) == T, 0, goals_kicked*6)) %>%
  mutate(behinds_score = ifelse(is.na(behinds_kicked) == T, 0, behinds_kicked)) %>%
  mutate(Score = goal_score + behinds_score)

# read data (can also web scrape)
table_ladder = load_afl_ladder()
betting_data = load_afl_betting()
match_data = load_afl_matches()

### home sweet home -------------------------------------------------

# get game year
game_dates = sapply(afl_games$date,
               function(x){
                 str = strsplit(as.character(x), split = " ")[[1]][1]
                 })
game_dates = as.character(game_dates)
game_dates = ymd(game_dates)
game_year = year(game_dates)
afl_games = afl_games %>%
  mutate(Year = game_year)
# View(afl_games)

# create a new column for the team home or away
max_n = nrow(afl_stats)
print("HACK HACK HACK")
rm = 3987:3996 #could use filter instead
keep_rows = (1:max(n))[-rm]
n = length(keep_rows)

# for(n in seq(1000, max_n, by = 2)){
  # print(n)
afl_stats_update <- afl_stats[keep_rows, ] %>%
  mutate(ground = rep(c("home", "away"), n/2)) %>% #nrow(afl_stats) / 2)) %>%
  # make it simple - throw away everything except, game_id, ground, score
  select(game_id, ground, Score) %>%
  # spread by game_id
  spread(key = ground, value = Score)
# }

# spread stuff
# join

# append game year to stats table
afl_join_stats <- inner_join(afl_stats_update, afl_games,
                             by = "game_id") %>%
  select(game_id, home, away, Year) %>%
  mutate(Winner = ifelse(home > away, "home", "draw" )) %>%
  mutate(Winner = ifelse(home < away, "away", Winner ))

# graph time
match_ground_plot <- ggplot(data = afl_join_stats, aes(x = Year)) +
  geom_bar(aes(fill = Winner), position = "fill") +
  geom_hline(yintercept = 0.5, linetype = "dashed") +
  ylab("Percentage of Games Won") +
  ggtitle("AFL")
match_ground_plot
print("Warning - some rows were omitted due to formatting errors in the game_id")
print("This omission had a knock on effect and produced NA values in the final analysis")

### Ladder - who wins based on the ladder -------------------------------------

# who was higher on the ladder for each match


# create table of higher / lower / draw

### Ladder - parallel visualisation -------------------------------------------

# Visualise a ladder for one year

# parallel Coordinates
install.packages("GGally")
library(GGally)

ladder = table_ladder[[121]]
num_rounds = ncol(ladder) - 1
num_teams = nrow(ladder)
# round_names = sapply(1:num_rounds, function(x){paste("Round", x, collapse = " ")})
round_names = as.character(1:num_rounds)
col_names = c("Team", round_names)
names(ladder) = col_names
ladder %<>%
  slice(2:19)

ladder_plot <- ggparcoord(data = ladder, columns = 2:(num_rounds + 1),
                   groupColumn = "Team", scale = "globalminmax") +
  geom_line(size = 1.2) +
  ylab("Ladder Position") +
  xlab("Round") +
  ggtitle("AFL Ladder") +
  theme_bw()
ladder_plot

# Change in ladder over time

