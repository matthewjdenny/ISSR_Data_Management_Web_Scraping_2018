###### Managing Multiple Datasets #####

# Some preliminaries:
rm(list = ls())

# Set your working directory to the workshop repo location. For me, this looks
# like:
setwd("~/Documents/RA_and_Consulting_Work/ISSR_Data_Management_Web_Scraping_2017/Data")

# We are going to be looking at a dataset that comprises 11 sessions of Congress
# and specifically the bills cosponsored by Senators over that period of time.
# This is a very complex data management problem:
Congresses <- 11


# Lets begin by loading in some data:
cat("Loading Raw Senate Cosponsorship Matrix Data... \n")

# Create a list object to store the data in
cosponsorship_data <- vector(mode = "list",
                             length = Congresses)

# Loop over sessions of Congress:
for (i in 1:Congresses) {
    # The files are indexed from 100 to 110, so we need to create a temporary
    # variable that we can use to load in the files:
    cur <- 99 + i
    cat("Currently working on congress:",cur,"\n")

    # Read in the current dataset:
    temp <- read.csv(paste(cur,"_senmatrix.txt", sep = ""),
                     stringsAsFactors = F,
                     header = F) # there are no column names in the raw data.


    # lets set some column names using 'paste()' for fun:
    colnames(temp) <-  paste("Bill",1:ncol(temp), sep = "_")

    # We are only going to look at the first 100 bills from each Congress to
    # save time. Alternatively, we could look at all of them:
    temp <- temp[,1:100]
    cosponsorship_data[[i]] <- list(raw_data = temp)
}


cat("Transforming Raw Data Into Cosponsorship Matrices...\n")

# Loop over sessions of Congress:
for (i in 1:Congresses) {
    cur <- 99 + i
    # Let the user know what iteration we are on:
    cat("Currently on Congress number: ",cur,"\n")

    # Extract the raw data so we can use it:
    temp <- cosponsorship_data[[i]]$raw_data

    # Create a sociomatrix to populate. Each entry in this matrix will record
    # the number of times Senator i cosponsored a bill introduced by Senator j.
    num_senators <- nrow(temp)
    temp_sociomatrix <- matrix(0,
                               ncol = num_senators,
                               nrow = num_senators)

    # This is an example of nested looping:
    for (j in 1:ncol(temp)) { # For every bill:

        # Find out who the bill sponsor is (coded as a 1):
        for (k in 1:nrow(temp)) { # For every Senator:
            if (temp[k,j] == 1) {
                sponsor <- k
            }
        }

        # Find all of the cosponsors:
        for (k in 1:nrow(temp)) { # For every Senator
            if (temp[k,j] == 2) {
                temp_sociomatrix[k,sponsor] <- temp_sociomatrix[k,sponsor] + 1
            }
        }
    }

    # Store the sociomatrix in a new field:
    cosponsorship_data[[i]]$sociomatrix <- temp_sociomatrix

}

# Give the entries in the list object descriptive names:
names(cosponsorship_data) <- paste("Congress",100:110,sep = "_")

# Function that counts the total number of multiple cosponsorships (where
# Senator i cosponsors a bill introduced by Senator j more than once) in a given
# Congress.
Multiple_Cosponsorships <- function(cosponsorship_matrix){

    total <- 0
    # Loop over rows:
    for (i in 1:nrow(cosponsorship_matrix)) {
        # Loop over columns:
        for (j in 1:ncol(cosponsorship_matrix)) {
            # Only increment total if the value is greater than 1:
            if (cosponsorship_matrix[i,j] > 1) {
                total <- total + 1
            }
        }
    }
    return(total)
}

# Try out our 'Multiple_Cosponsorships()' function:
Multiple_Cosponsorships(cosponsorship_data[[1]]$sociomatrix)

# We can use functions inside of functions as well:
Multiple_Cosponsorships_per_Congress <- function(data){
    # Get the total number of Congresses:
    num_congs <- length(data)

    # Allocate a vector of zeros to store our results:
    counts <- rep(0, times = num_congs)

    # Loop over sessions of Congress:
    for (i in 1:num_congs) {
        cur <- 99 + i
        cat("Currently on Congress Number: ", cur ,"\n")

        # Get the number of multiple cosponsorships for this session of
        # Congress:
        counts[i] <- Multiple_Cosponsorships(data[[i]]$sociomatrix)
    }

    # Return the results:
    return(counts)
}

# Try out our 'Multiple_Cosponsorships_per_Congress()' function:
Mult_Cosp_per_Congress <- Multiple_Cosponsorships_per_Congress(cosponsorship_data)

# Plot our work
barplot(Mult_Cosp_per_Congress,
        xlab = "Congress",
        ylab = "Number of Multiple Cosponsorships",
        names = c(100:110),
        col = rainbow(11))


# We can also try loading in our functions from a source file (you will need to
# change the path on your computer):
source('~/Documents/RA_and_Consulting_Work/ISSR_Data_Management_Web_Scraping_2017/Scripts/My_Functions.R')

# Lets test these functions out:
Threshold_103 <- Threshold(1,cosponsorship_data$Congress_103$sociomatrix)
RowSums_103 <- Row_Sums(cosponsorship_data$Congress_103$sociomatrix)

# Now we can have some fun by creating some network plots of each sociomatrix:
install.packages("statnet", dependencies = TRUE)
library(statnet)

# Here we are going to set some variables that we will use in plotting:
par(mfrow = c(1,1))
colors <- 1:11
years <- 1:11

# We are going to define a function that takes a year and a color and makes a
# network plot
netplot <- function(year, color){

    # create an objet of class "network" that can be used by statnet to generate
    # a network plot:
    net <- as.network(cosponsorship_data[[year]]$sociomatrix)

    # When we give 'plot()' a network object, it returns a network plot:
    plot(net, vertex.col = color)

    # Wait for one second after plotting before moving on:
    Sys.sleep(1)

    # This function does not return anything.
}

# Now we are going to use a new kind of function we have not encountered before.
# It is part of the 'apply()' family of functions. The first argument is the
# function we want to "apply" to a bunch of different datasets. All arguments
# after this are given in the order that they are provided to the 'netplot()'
# function. This will make more sense if we try it out:
mapply(netplot,
       years,
       colors)