library(wordcloud2)
library(readr)
library(dplyr)
library(e1071)
library(mlbench)

# Text mining packages
library(tm)
library(SnowballC)
library("wordcloud")
library("RColorBrewer")


#loading the data
t1 <- read_csv("biden_data.csv")
glimpse(t1)  

# Create corpus
corpus = Corpus(VectorSource(t1$text))

# Look at corpus
corpus[[1]][1]

#Conversion to Lowercase
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, tolower)


#Removing Punctuation
corpus = tm_map(corpus, removePunctuation)

corpus[[1]][1]

#Remove stopwords
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
corpus = tm_map(corpus, toSpace, ".")
corpus = tm_map(corpus, removeWords, c("joebiden","rt","amp","joe", "biden", "'s", "'re",stopwords("english")))

corpus[[1]][1]

# Stemming
corpus = tm_map(corpus, stemDocument)

corpus[[1]][1]

# Eliminate white spaces
corpus = tm_map(corpus, stripWhitespace)

corpus[[1]][1]

#Create Document Term Matrix
DTM <- TermDocumentMatrix(corpus)
mat <- as.matrix(DTM)
f <- sort(rowSums(mat),decreasing=TRUE)
dat <- data.frame(word = names(f),freq=f)
head(dat, 5)

#WordCloud 3
set.seed(100)
wordcloud(words = dat$word, freq = dat$freq, max.words=250, random.order=FALSE, rot.per=0.30, colors=brewer.pal(8, "Dark2"))

wordcloud(words = dat$word, freq = dat$freq, max.words=250, random.order=TRUE, rot.per=0.35, colors=brewer.pal(12, "Paired"))

wordcloud2(data = dat, size=1.6, color='random-dark')

wordcloud2(data = dat, size = 0.5, color='random-light', shape='cardoid')

wordcloud2(data = dat, size = 0.3, color='yellow', shape='star')