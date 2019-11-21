## Question 1
bbdata <- read.table("UWvMSU_1-22-13.txt", header = TRUE)

UW_scores <- bbdata[bbdata$team == "UW", ]
MSU_scores <- bbdata[bbdata$team == "MSU", ]

cum_sum_UW <- c()
cum_sum_MSU <- c() 

cum_sum_UW[1] <- UW_scores$score[1]
cum_sum_MSU[1] <- MSU_scores$score[1]

for ( i in 2:nrow(UW_scores) ) {
  cum_sum_UW[i] <- cum_sum_UW[i - 1] + UW_scores$score[i]
}

for ( i in 2:nrow(MSU_scores) ) {
  cum_sum_MSU[i] <- cum_sum_MSU[i - 1] + MSU_scores$score[i]
}

plot(UW_scores$time, cum_sum_UW, type = 'l', xlab = "Time", ylab = "Score", col = "red")
lines(MSU_scores$time, cum_sum_MSU, type = 'l', col = 139)

## Question 2

rand_num <- sample(1:100, 1)
guess <- 0
ntry <- 0
print("I'm thinking of a number between 1 and 100")
while ( guess != rand_num && ntry < 11 ){
  guess <- as.integer(readline(prompt="Guess: "))
  if ( guess < rand_num ) {
    print("Higher")
  } else if ( guess > rand_num ) {
    print("Lower")
  } else {
    print("Correct")
  }
  ntry = ntry + 1  
}