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
