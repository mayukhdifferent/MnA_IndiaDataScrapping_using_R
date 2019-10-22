# check and install dependent packages in R
pkgs <-c('twitteR','ROAuth','httr','plyr','stringr','ggplot2','plotly')
for(p in pkgs) if(p %in% rownames(installed.packages()) == FALSE) {install.packages(p)}
for(p in pkgs) suppressPackageStartupMessages(library(p, quietly=TRUE, character.only=TRUE))

# Set API Keys.Below keys are sample only.Keys need to be generated using personal twitter account.
api_key <- "dOQFWD0RnmMV4eru4nUp8UG3C"
api_secret <- "0omNIMld9HrrBXLAKVXqaIdpUeeGCzlVr7G6aBCYsCHu3EMEYq"
access_token <- "84611119-3D0eyGI6hCfeto44FKjsT3p67smjYsCOIQiTCYi7v"
access_token_secret <- "DcNi9PzEE4tIkhaRpff4Qa7HUQZDstFSPcDKwIfZu8cRw"
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)


# Grab latest tweets from CCI_India timeline
timeline_cciindia <- userTimeline('@CCI_India', n=1000)

#make data frame
df_cciindia <- do.call("rbind", lapply(timeline_cciindia, as.data.frame))
row.names(df_cciindia) <- NULL
View(df_cciindia)
tml_cciindia <- data.frame(df_cciindia$text, df_cciindia$created)
row.names(tml_cciindia) <- NULL
View(tml_cciindia)

# export the results into csv file
write.table(tml_cciindia, "c:/Users/USER/Desktop/iba/tweet_scrap/tml_cciindia.csv", sep=",",row.names = F)