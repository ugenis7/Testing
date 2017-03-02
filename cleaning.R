library( tidyverse )
library( lubridate )

tweets <- read_csv( file = "tweets.csv" )

t_time<- tibble( date_time = parse_datetime(
  tweets$X3,
  format = "%B %d, %Y at %H:%M%p"
)
)

medianoche <- which( hour( t_time$date_time ) == 12)
hour(t_time$date_time[medianoche]) <- 00

probs <- problems( parse_datetime(
  tweets$X3,
  format = "%B %d, %Y at %H:%M%p"
)
)

t_time[probs$row,] <- tibble( parse_datetime(
  tweets$X3[probs$row],
  format = "%B %d, %Y at %H:%M%*"
)
)

malo <- which( tweets$X3 == "April 25, 2015")

tweets <- bind_cols(tweets, t_time)

tweets <- tweets[ -malo, ]

names(tweets) <- c(
  "account",
  "tweet",
  "link",
  "txt",
  "date_time"
)

tweets <- select( tweets, date_time, account, tweet, link )
attributes(tweets$date_time)$tzone <- "Europe/Paris"
tweets$date_time <- tweets$date_time + (60 * 60 * 5)
attributes(tweets$date_time)
tweets[18,]
write_csv(  x = tweets, "tidy.csv")
