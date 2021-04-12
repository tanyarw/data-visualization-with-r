library(ggplot2)
library(tidyverse)

books <- read.csv(file = 'books.csv', header= TRUE)
books
names(books)

# 1. Remove NA values (delete rows?)
books.sub <- na.omit(books)
books.sub

# 2. Visualize frequency distribution of checkouts in the book dataset (just one var?)

p1 <- ggplot(books.sub, aes(strtoi(tot_chkout))) + geom_bar(fill = "#000000")
p1 + theme_gray()

# 3. Visualize boxplot plot high usage books by call number class
#[Hint: derive new variable high usage books which have more than 10 checkouts] 
# and color by subCollection- any three category
library(dplyr)
high_usage_books = filter(books.sub,strtoi(books.sub$tot_chkout)>10)

# selecting only 3 categories of subCollection by removing category "reserves"
high_usage_books_2<-high_usage_books[high_usage_books$subCollection != 'reserves', ]
p2<-ggplot(high_usage_books_2, aes(x=callnumber, fill=subCollection ))+geom_boxplot()
p2 + theme_classic()

p2 <- ggplot(high_usage_books_2, aes(x=callnumber, y=strtoi(tot_chkout), fill=subCollection ))+geom_boxplot()
p2 + theme_classic()

# 4. Visualize stacked bar and group chart high usage books by call number class
# [Hint: derive new variable high usage books which have more than 10 checkouts] 
# and color by subCollection- any four category
library(gridExtra)

#stack chart 
p3 <- ggplot(high_usage_books, aes(fill=subCollection,x=callnumber)) + geom_bar(position="stack")
p3 + theme_dark()
p4 <- ggplot(high_usage_books, aes(fill=subCollection,x=callnumber)) + geom_bar(position="dodge")
p4 + theme_dark()

#group chart WITH total checkout
p5 <- ggplot(high_usage_books, aes(fill=subCollection,x=callnumber, y=strtoi(tot_chkout))) + geom_bar(position="stack", stat="identity")
p5 + theme_dark()
p6 <- ggplot(high_usage_books, aes(fill=subCollection, x=callnumber, y=strtoi(tot_chkout))) + geom_bar(position="dodge", stat="identity")
p6 + theme_dark()

# 5. Create a bar plot that depicts the number of items in each sub-collection, 
# faceted by format. Arrange sub plots horizontally.
# Apply various themes in the above plots.

p5<- ggplot(books.sub, aes(fill=subCollection, x=subCollection)) + 
  geom_bar() + facet_wrap(~format) 

p5+ theme_linedraw() + coord_flip()