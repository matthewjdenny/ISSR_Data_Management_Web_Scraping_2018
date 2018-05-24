###### Intermediate R Workshop: Programming #####


### Preliminaries ###

rm(list = ls())

# Set your working directory to the workshop repo location. For me, this looks
# like:
setwd("~/Documents/RA_and_Consulting_Work/ISSR_Data_Management_Web_Scraping_2017")

### cat vs. print ###

# The 'cat()' function will print things without "" marks around them, which
# often looks nicer, but it also does not skip to a new line if you call it
# multiple times inside of a function (something we will get to soon), or a
# loop. Lets try out both:
print("Hello World")
cat("Hello World")

# Now we can try them inside bracketts to see how 'cat()' does not break lines:
{
    cat("Hello")
    cat("World")
}

{
    print("Hello")
    print("World")
}

# So we have to manually break lines with 'cat()' using the "\n" (newline)
# symbol:
{
    cat("Hello \n")
    cat("World")
}


### The 'paste()' function, and generating informative messages ###

# The 'paste()' function takes as many string, number or variable arguments as
# you want and sticks them all together using a user specified separator:

# Lets define a variable to hold the number of fingers we have:
fingers <- 8

# Now lets print out how many fingers we have:
print(paste("Hello,", "I have", fingers, "fingers", sep = " "))

# Now lets separate with dashes just for fun:
print(paste("Hello,", "I have", fingers, "fingers", sep = "-----"))

# We can also try the same thing with 'cat()':
cat(paste("Hello,", "I have", fingers, "fingers", sep = " "))

# However, with 'cat()', we can just skip the paste part and it will print the
# stuff directly:
cat("Hello,", "I have", fingers, "Fingers", sep = " ")

# If we want 'cat()' to break lines while it is printing, we can also include
# the "\n" symbol at the end (or anywhere, for that matter):
cat("My Grocery List:\n", "1 dozen eggs\n",
    "1 loaf of bread\n 1 bottle of orange juice\n",
    "1 pint mass mocha", sep = " ")


### For Loops ###

# 'for()' loops are a way to automate performing tasks by telling R how many
# times we want to do something. Along with conditional statments and comparison
# operators, loops are more powerful than you can immagine. Pretty much
# everything on your computer can be boiled down to a combinations of loops and
# conditionals.

# Here is an example 'for()' loop, with its English translation:
# for (           i in           1:10){
# for each number i in the range 1:10

# Lets try and example using a for() loop -- first lets create a vector:
my_vector <- c(20:30)
# Take a look at tis contents:
cat(my_vector)

# Notice how the value of i changes when we are inside the loop
i <- 76
# Loop over each index (position) in the vector at replace it with its square
# root:
for (i in 1:length(my_vector)) {
    cat(i,"\n")
    my_vector[i] <- sqrt(my_vector[i])
}



# Display the result:
cat(my_vector)

# No lets try adding numbers together using a 'for()' loop:
my_num <- 0

for (i in 1:100) {
    my_num <- my_num + i

    cat("Current Iteration:",i,"My_num value:",my_num,"\n")
}


### If/Else Statements ###

# If/else statements give your computer a "brain", they let it see if somethng
# is the case, and dependent on that answer, your computer can then take some
# desired action.

# English translation of an if statement:
# if (some condition is met) {
#      do something
# }

# Lets try an example to check and see if our number is less than 20:
my_number <- 19

if (my_number < 20) {
    cat("My number is less than 20 \n")
}

# Now we try an example where the condition is not satisfied:
my_number <- 22

if (my_number < 20) {
    cat("My number is less than 20 \n")
}


# A more complex example using an 'if()' statement inside of a 'for()' loop:
my_vector <- c(20:30)

for (i in 1:length(my_vector)) {
    cat("Current Index:",i,"Value:",my_vector[i],"\n")

    if (my_vector[i] == 25) {
        cat("The square root is 5! \n")
    }
}

# You can also add in an 'else' statement to do something only if the condition
# is not met:
my_vector <- c(20:30)

for (i in 1:length(my_vector)) {
    cat("Current Index:",i,"Value:",my_vector[i],"\n")

    if (my_vector[i] == 25) {
        print("I am 25!")
    } else {
        print("I am not 25!")
    }
}


### Functions ###

# User defined functions allow you to easily reuse a piece of code. These are
# really the heart of R programming, and the basis for all R packages. Mastering
# functions will allow you to enormously speed up your workflow and take on much
# more complex projects.

# In our first example, we are going to define a function that will take the sum
# of a particular column of a matrix (where the column index is a number):
my_column_sum <- function(col_number,
                          my_matrix){

    # Take the column sum of the matrix:
    col_sum <- sum(my_matrix[,col_number])

    # We always include a return statement at the end of the function which
    # gives us back whatever the function computed. Note that we can only return
    # one object (variable) in this return statement:
    return(col_sum)
}

# Once we have defined our function, we simply enter it into the console. If all
# went well, it will appear like nothing happened. However, the function will
# now be available for us to use.

# Lets try out our function on some example data:
my_mat <- matrix(1:100,
                 nrow = 10,
                 ncol = 10)

# Look at our matrix:
my_mat

# Now we use 'my_column_sum()' to take the sum of all elements in the first
# column:
temp <- my_column_sum(col_number = 1,
                      my_matrix = my_mat)

# Lets double check our result:
sum(my_mat[,1])

# Now we can loop through all columns in the matrix and apply our function to
# each one. This is where the real power of functions comes out --that we can
# use them inside of more complex programs, even inside other functions:
for (i in 1:10) {
  cat(my_column_sum(col_number = i,
                    my_matrix = my_mat),"\n")
}

# To illustrate this idea, we can now write a function that calls
# 'my_column_sum()' to automatically do the above for any input matrix:
col_sums_for_fun <- function(mat) {
    # Figure out the number of columns:
    cols <- ncol(mat)

    # Loop over columns:
    for (i in 1:cols) {
        # Calculate the column sum:
        cat(my_column_sum(i, mat),"\n")
    }
}

# Lets try our new function 'col_sums_for_fun()' with a larger matrix:
my_mat2 <- matrix(301:700,
                  nrow = 20,
                  ncol = 20)

# Look at our matrix:
my_mat

# Use our new function:
col_sums_for_fun(my_mat2)


### An Example with Real Data ###

# lets read in some data
load("./Data/Example_Data.Rdata")

# In this example, we are going to work with a dataset of metadata on all bills
# introduced in the United States Congress between 2011-2012. Among many
# variables, it contains indicators of the number of cosponsors, the month the
# bill was introduced, the chamber it was introduced in (House or Senate), the
# major topic code (see reference list below) and the party of the sponsor.

# Lets say we wanted to look at a subset of all bills that were introduced in
# the House that were about any of the first ten topics, and then take the sum
# of the number of bills introduced by each party that passed the house, and
# divide by the total number of cosponsorships they recieved, to get a weight
# for the relative importance of each cosponsorship to getting a bill passed.
# Here are the topics:

# Major topic numbers:
# 1. Macroeconomics
# 2. Civil Rights, Minority Issues, and Civil Liberties
# 3. Health
# 4. Agriculture
# 5. Labor and Employment
# 6. Education
# 7. Environment
# 8. Energy
# 9. Immigration
# 10. Transportation
# 12. Law, Crime, and Family Issues
# 13. Social Welfare
# 14. Community Development and Housing Issues
# 15. Banking, Finance, and Domestic Commerce
# 16. Defense
# 17. Space, Science, Technology and Communications
# 18. Foreign Trade
# 19. International Affairs and Foreign Aid
# 20. Government Operations

# Lets start by subsetting our data --we only want HR bills with a major topic
# less than 11:
reduced_data <- data[which(data$BillType == "HR" & data$Major < 11),]

# Now we allocate a blank matrix to hold the statistics we plan to calculate. It
# should have two columns (Democrat and Republican), and 10 rows (one for each
# topic):
party_topic_statistics <- matrix(0,
                                 nrow = 10,
                                 ncol = 2)

# At the highest level, we need to loop over topics:
for (i in 1:10) {

    # Now for each topic we loop over parties:
    for (j in 1:2) {

        # Set the variable we are going to lookup against for party ID:
        if (j == 1) {
            party <- 100 # Code for a Democrat sponosred bill
        } else {
            party <- 200 # Code for a Republican sponosred bill
        }

        # Subset our data down to the current party/topic combination:
        current_data <- reduced_data[which(reduced_data$Party == party &
                                               reduced_data$Major == i),]

        # Check to make sure that there are more than zero observations for the
        # current party/topic combination:
        if (nrow(current_data) > 0) {

            # Now subset to those bills that passed the House:
            current_data <- current_data[which(current_data$PassH == 1),]

            # Here again we should check to make sure we are not left with zero
            # rows. However, in this example, I will do doing this check in a
            # different way (for the purposes of illustration).

            # Calculate the weight:
            cosponsorship_weight <- nrow(current_data) /
                sum(current_data$Cosponsr)

            # Check to see if it is a valid weight, if not, set equal to zero:
            if (is.nan(cosponsorship_weight) | cosponsorship_weight > 1 ) {
                cosponsorship_weight <- 0
            }

            # Take the current weight and put it in our dataset:
            party_topic_statistics[i,j] <- cosponsorship_weight
        }
    }
}

### Basic Example Plotting Results ###

# Load the labels for bill major topics. I did these by hand:
load("./Data/Topic_Lookup.Rdata")

# Look at the labels:
major_topic_lookup

# Replace a really long label with a shorter title for plotting
major_topic_lookup[2,1] <- "2. Civil Rights"

# We want to output a pdf with our plot, so I am going to set my working
# directory to my Desktop to make the plot easier to find:
setwd("~/Desktop")

# Specify the dimensions of our PDF output, and the filename:
pdf(width = 5, # in inches
    height = 8, # in inches
    file = "My_Plot.pdf")

# We want a wider margin on the bottom and left sides so our text will fit.
# margins go (bottom, left, top, right):
par(mar = c(13,5,2,2))

# Plot our data using 'matplot()', which lets us easily plot more than one
# series on the same axes:
matplot(x = 1:10,  # this tells matplot what the x values should be
        y = cbind(party_topic_statistics[,2],party_topic_statistics[,1]), # this
        # reverses Democrat and Republican so it is easier to see the Democrat
        # points and then specifies the y values
        pch = 19, # this sets the point type to be dots
        xlab = "", # this tells 'matplot()' not plot an x label as we will
        # specify it later
        ylab = "Cosponsorships Per Passed Bill", # the y label
        xaxt = "n", # don't plot any x-axis ticks
        col = c("red","blue"), # The colors for the dots, blue is Democrat, red
        # is Republican
        ylim = c(-0.01,.2) # the y-limits of the plotting range
        )

# Now we can add a custom x-axis with our topic labels:
axis(side = 1,
     at = 1:10,
     tick = FALSE,
     labels = major_topic_lookup[1:10,1],
     las = 3)

# We are done making our PDF, so we finalize it:
dev.off()

