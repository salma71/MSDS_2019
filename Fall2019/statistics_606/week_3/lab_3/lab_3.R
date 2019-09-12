load("kobe.rdata")
head(kobe)
kobe$basket[1:9]

# What does a streak length of 1 mean, i.e. how many hits and misses are in a streak of 1? What about a streak length of 0?
# 1: means one hit followed by missed hit. one hit - one miss. streak 0 means no hits, only missed hits.

kobe_streak <- calc_streak(kobe$basket)
barplot(table(kobe_streak))

# Describe the distribution of Kobe’s streak lengths from the 2009 NBA finals. 
  # It was a right-skewed distribution
# What was his typical streak length? How long was his longest streak of baskets?
  # The typical streak length was 0. Streaks of 1 were second with 24, then 6 streaks of 2 and 3, and only one streak of 4.

outcomes <- c("heads", "tails")
sample(outcomes, size = 1, replace = TRUE)

sim_fair_coin <- sample(outcomes, size = 100, replace = TRUE)
sim_fair_coin
table(sim_fair_coin)

sim_unfair_coin <- sample(outcomes, size = 100, replace = TRUE, prob = c(0.2, 0.8))
sim_unfair_coin
table(sim_unfair_coin)

# In your simulation of flipping the unfair coin 100 times, how many flips came up heads?
  # 17 times

?sample

outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size = 1, replace = TRUE)
table(sim_basket)

# What change needs to be made to the sample function so that it reflects a shooting percentage of 45%? 
  # add prob = c(0.45, 0.55) argument to the sample function

# Make this adjustment, then run a simulation to sample 133 shots. 
# Assign the output of this simulation to a new object called sim_basket.

outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size = 133, replace = TRUE, prob = c(0.45, 0.55))
table(sim_basket)

sim_basket

# On your own

ind_streak <- calc_streak(sim_basket)
barplot(table(ind_streak))

# 1. Describe the distribution of streak lengths. 
  # Right-skewed distribution 
# What is the typical streak length for this simulated independent shooter with a 45% shooting percentage? 
  # 0 
# How long is the player’s longest streak of baskets in 133 shots?
  # 2

# If you were to run the simulation of the independent shooter a second time, 
# how would you expect its streak distribution to compare to the distribution from the question above? Exactly the same? Somewhat similar? Totally different? Explain your reasoning.
  # I expect to be the same as always the percentage is 45% to 55% for hit and miss respectively. 

# How does Kobe Bryant’s distribution of streak lengths compare to the distribution of streak lengths for the simulated shooter? Using this comparison, do you have evidence that the hot hand model fits Kobe’s shooting patterns? Explain.
  # The streak length for the simulated shooter is longer than Kobe Bryant 6 - 4 baised to the simulator shooter. 
  # The distributions look very similar. Therefore, there doesn’t appear to be evidence for Kobe Bryant’s hot hand. 

table(kobe_streak)
table(ind_streak)

# the two tables are not having the same length, so I implemented a logic to put a zero in the table that
# doesn't have a corresponding value.
kobe_df <- unlist(table(kobe_streak))
ind_df <- unlist(table(ind_streak))
if (length(kobe_df) < length(ind_df)) {
  kobe_df <- c(kobe_df,rep(0,length(ind_df) - length(kobe_df)))
} else {
  ind_df <- c(ind_df,rep(0,length(kobe_df) - length(ind_df)))  
}

kobe_df

data_df <- rbind(ind_df,kobe_df)
data_df

barplot(data_df ,beside = T,col=c("purple","yellow"),xlab="Streak Lengths",ylab = "Number of Streaks",legend=c("Independent Shooter","Kobe Bryant"))

# to compare the two models, we have to do statistical summary to have a clear comparasion.

# get the median

IQR(kobe_df)
IQR(ind_df)

mean(kobe_df)
mean(ind_df)

# from analysis above we conclude that there is no major difference between kobe model and independent model
# both distributions are close together. 






