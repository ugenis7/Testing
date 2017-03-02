library( tidyverse )
library( lubridate )
library( stringr )

tweets <- read_csv( file = "tidy.csv" )

users <- unique(tweets$account)

tweets %>%
  ggplot( aes( date_time ) ) + 
  geom_freqpoly( binwidth = 60 * 60 * 24 * 2 )

tweets %>%
  ggplot( aes( hour( date_time ) ) ) +
  geom_bar()

tweets %>%
  ggplot( aes( wday( date_time, label = TRUE ) ) )+
  geom_bar()

tweets %>%
  ggplot( aes( month( date_time, label = TRUE ) ) )+
  geom_bar()

tweets %>%
  filter( account == "@ugenis7" ) %>%
  ggplot( aes( date_time ) ) +
  geom_freqpoly( binwidth = 60 * 60 * 24 * 2 ) 

# f <- data.frame( table( tweets$account ) )
# as_tibble(f[ order( -f$Freq ), ])
# 
# summarise( month( tweets$date_time ), count )
# 
 
View(tweets[!is.na(str_extract(tweets$tweet,"economics")),])

hash <- str_extract_all( string = tweets$tweet, pattern = "#\\w+" )
hash <- as.factor( unlist(hash) )
hash_table <- table (  tolower( hash ) )
hash_table <- hash_table[ order( - hash_table ) ]
rank( hash_table )
