# Libraries
library(tidyverse)
library(tidytext)
library(dplyr)
library(wordcloud)
library(shiny)
library(DT)
library(dplyr)
library(stringr)
library(tidyr)
library(tibble)
library(tidytext)
library(textdata)
library(Hmisc)
library(sentimentr)
library(zoo)
library(flextable)
library(tm)
library(wordcloud)

# Working direction
setwd("~/Documents/Data332")
df_1= read.csv("Consumer_Complaints.csv")
saveRDS(df,"Consumer_Complaints.rds")
df=readRDS("Consumer_Complaints.rds")
df = df_1 %>%
  select(State, Company, Issue, Company.response.to.consumer, Product) %>%
  drop_na()
df_2=df_1[1:50000,]
nrc= tidytext::get_sentiments("nrc")
df_2= df_1 %>%
  unnest_tokens(word,Company.response.to.consumer) %>%
  anti_join(stop_words)
df_3 =df_2 %>% 
  inner_join(lexicon) %>% 
  group_by(word) %>% 
  count(sentiment, sort = TRUE) 
lexicon = get_sentiments("nrc")
df_3 %>%
  group_by(sentiment) %>%
  slice_max(n, n = 10) %>% 
  ungroup() %>%
  mutate(sentiment= reorder(sentiment, n)) %>%
  ggplot(aes(n, sentiment, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(x = "count",
       y = "sentiment")
lexicon = get_sentiments("bing")


df_3%>%
  ggplot(aes(x=n, y=sentiment)) +
  geom_bar(stat="identity", fill="purple")+
  labs(x = "word count", y = "Sentiment")
geom_text(aes(label=NA), vjust=-0.3, size=3.5)+
  theme_minimal()
df_3 %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("orange", "blue"),
                   max.words = 100)
column_names<-colnames(df_2) #for input selections
ui<-fluidPage( 
  
  titlePanel(title = " Customer Complaints"),
  
  fluidRow(
    column(2,
           selectInput('X', 'Choose X',column_names,column_names[4]),
           selectInput('Y', 'Choose Y',column_names,column_names[2])
    ),
    column(4,plotOutput('plot_01')),
    column(6,DT::dataTableOutput("table_01", width = "100%"))
  )
)

server<-function(input,output){
  
  output$plot_01 <- renderPlot({
    ggplot(df_2,aes_string(x=input$X, y=input$Y, colour=Input$Splitby))+
      geom_smooth()
  }
  
  shinyApp(ui=ui, server=server)
  
  
##                                 This Part is for the Word Cloud
  
# Load the data set
  setwd("~/Documents/Data332")
  df <- read.csv("Consumer_Complaints.csv")
  
  
  corpus <- iconv(df$Product)
  corpus <- Corpus(VectorSource(corpus))
  inspect(corpus[1:5])
  
  # Clean the data set
  corpus <- tm_map(corpus, tolower)
  inspect(corpus[1:5])
  
  corpus <- tm_map(corpus, removePunctuation)
  inspect(corpus[1:5])
  
  corpus <- tm_map(corpus, removeNumbers)
  inspect(corpus[1:5])
  
  cleanset <- tm_map(corpus, removeWords, stopwords('english'))
  inspect(cleanset[1:5])
  
  removeURL <- function(x) gsub('http[[:alnum:]]*', '', x)
  cleanset <- tm_map(cleanset, content_transformer(removeURL))
  inspect(cleanset[1:5])
  
  tdm <- TermDocumentMatrix(cleanset)
  tdm <- as.matrix(tdm)
  tdm[1:10, 1:20]
  
  # Bar plot
  w <- rowSums(tdm)
  w <- subset(w, w>=25)
  barplot(w,
          las = 2,
          col = rainbow(50))
  
  # Word cloud
  w <- sort(rowSums(tdm), decreasing = TRUE)
  set.seed(222)
  wordcloud(words = names(w),
            freq = w,
            max.words = 150,
            random.order = F,
            min.freq = 5,
            colors = brewer.pal(8, 'Dark2'),
            scale = c(5, 0.3),
            rot.per = 0.7)
  
  #Sentimental analysis
  cdata <- read.csv("Consumer_Complaints.csv", header = T)
  tweets <- iconv(cdata$Product)
  
  s <- get_nrc_sentiment(tweets)
  head(s)
  get_nrc_sentiment(ugly)
  
  # Bar plot
  barplot(colSums(s),
          las = 2,
          col = viridis::viridis(2),
          ylab = 'Count',
          main = 'Sentiment')
  
  
  
  
  