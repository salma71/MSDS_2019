
df <- data.frame(Doubles=double(),
                 Ints=integer(),
                 Factors=factor(),
                 Logicals=logical(),
                 Characters=character(),
                 stringsAsFactors=FALSE)
for (i in 1:nrow(tournament_subset)) { # for i = 1
  browser()
  id <- as.numeric(str_extract_all(tournament_subset$Round[i], "([0-9]{1,})")) #39
  winning_opp_year <- as.data.frame(as.numeric(tournament_subset[id, 5])) # 1436
  winning_year <- as.data.frame(as.numeric(tournament_subset$Pre[i])) #1794
  df <- rbind(df, winning_year)
  df <- rbind(df, winning_opp_year)
  #temp <- data.frame(paste(winning_year, winning_opp_year)) 
  #names(df) <- c("winning_year1", "winning_opp_year1")

  #avg_rtg <- rbind(avg_rtg, temp)
}
df

