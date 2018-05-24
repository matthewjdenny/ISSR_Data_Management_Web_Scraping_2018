# Text Processing and Analysis
# Developed by: Matthew J. Denny
# email: mdenny@psu.edu with questions or comments

# clear out environment
rm(list = ls())

# preliminaries, make sure we have the right packages downloaded
# install.packages("quanteda", dependencies = TRUE)
# install.packages("stringr", dependencies = TRUE)

# load packages
require(stringr)
require(quanteda)


# set working directory (you will need to change this for your computer)
setwd("~/Documents/RA_and_Consulting_Work/ISSR_Data_Management_Web_Scraping_2017/Data/Bill_Text")

# read in documents
documents <- rep("", length = 100)
# loop over documents
for (i in 1:100) {
    cat("currently working on bill:",i,"\n")
    # set the current bill number
    ind <- 97000 + i
    # get the text of the bill
    text <- readLines(paste("Bill_",ind,".txt", sep = ""))
    # collapse it together into a string and store it in a vector
    documents[i] <- paste0(text,collapse = " ")
}

# use quanteda to create a document term matrix
doc_term_matrix <- quanteda::dfm(documents,
                                 tolower = TRUE,
                                 remove_numbers = TRUE,
                                 remove_punct = TRUE,
                                 remove_separators = TRUE,
                                 remove_twitter = FALSE,
                                 stem = TRUE)

# look at some of the vocabulary
head(doc_term_matrix@Dimnames$features, n = 100)

# get column sums
word_counts <- colSums(doc_term_matrix)

# order word counts
word_counts <- word_counts[order(word_counts, decreasing = TRUE)]

# top words
head(word_counts,n = 100)

# bottom words
tail(word_counts,n = 20)




## Text Processing with Quanteda ##

# We are going to use the Quanteda R package in this section. First we need to
# install it:
install.packages("quanteda", dependencies = TRUE)
library(quanteda)

# Lets load in some example data:
corp <- quanteda::data_corpus_inaugural

summary(corp)

# Let's look at one document (Washington's first inaugural)
texts(data_corpus_inaugural)[1]

# Let's look at the contexts in which a couple of words have been used
#  kwic = "key words in context"

options(width=120)
kwic(data_corpus_inaugural, "humble", window=4)

kwic(data_corpus_inaugural, "tombstones", window=4)
options(width=80)

# The common goal of most text preprocessing is to generate a document-term
# matrix, where each row represents a document, and each column represents the
# count of a vocabulary term in the current document.
doc_term_matrix <- quanteda::dfm(corp,
                                 tolower = TRUE,
                                 stem = FALSE,
                                 remove_punct = TRUE,
                                 remove = stopwords("english"),
                                 ngrams = 1)

# let's take a look at some vocabulary terms:
# What kind of object is doc_term_matrix?
class(doc_term_matrix)

# How big is it? How sparse is it?
doc_term_matrix

# Let's look inside it a bit:
doc_term_matrix[1:5,1:5]

# What are the most frequent terms?
topfeatures(doc_term_matrix,40)

# Besides "tombstones," what other words were never used in an inaugural before Trump?
unique_to_trump <- as.vector(colSums(doc_term_matrix) == doc_term_matrix["2017-Trump",])
colnames(doc_term_matrix)[unique_to_trump]

# Wordclouds are an abomination, but ...
set.seed(100)
textplot_wordcloud(doc_term_matrix, min.freq = 100, random.order = FALSE,
                   rot.per = .25,
                   colors = RColorBrewer::brewer.pal(8,"Dark2"))

set.seed(100)
textplot_wordcloud(doc_term_matrix["2017-Trump",], min.freq = 3, random.order = FALSE,
                   rot.per = .25,
                   colors = RColorBrewer::brewer.pal(8,"Dark2"))

# We can also change the settings:
doc_term_matrix <- quanteda::dfm(corp,
                                 tolower = FALSE,
                                 stem = TRUE,
                                 remove_punct = FALSE,
                                 remove = stopwords("english"),
                                 ngrams = 1)

# How big is it now? How sparse is it now?
doc_term_matrix

# What are the most frequent terms?
topfeatures(doc_term_matrix,40)

# Or try adding longer n-grams
doc_term_matrix <- quanteda::dfm(corp,
                                 tolower = TRUE,
                                 stem = FALSE,
                                 remove_punct = TRUE,
                                 remove = stopwords("english"),
                                 ngrams = 2)

# How big is it now? How sparse is it now?
doc_term_matrix

# What are the most frequent terms?
topfeatures(doc_term_matrix,40)
