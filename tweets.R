library( tidyverse )
library( readxl )
library( wordcloud )

sequence <- as.character( 1:94 )
sequence[1:9] <- paste( "0", sequence[1:9], sep = "" )

files <- c( paste( "Twitter/", sequence, ".xlsx", sep = "" ) )

listota <- list()
for( i in seq_along(files)){
  listota[[i]] <- read_excel( path = files[ i ], col_names = FALSE )
}

tibblesote <- tibble()
for( i in 1:94 ){
  tibblesote <- rbind(tibblesote, listota[[i]])
}

write_csv(x = tibblesote, path = "tweets.csv")
