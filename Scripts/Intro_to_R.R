###### Introduction To R: Basic Programming and Data I/O #####


###### Preliminaries -- Setting Up R To Do Work ######

# Commenting: wherever you insert a '#', everything that comes after it will be
# ignored when entered into the R console. This means you can leave notes to
# yourself about what each line of code does, or 'comment out' lines of code you
# are no longer using. I make extensive use of comments in all of my code. You
# should too!

# Clearing your workspace: this removes all data and variables current in your
# 'R Environment'. As you will see, when you create variables they will continue
# to be available to you for the rest of your R session once you have made them,
# unless you remove them from memory. The line of code below will remove
# everything from memory. This can be useful if you want to rerun several
# different scripts without closing R after using each one.
rm(list = ls())

# Set your working directory -- This is where R goes to look for files and save
# stuff by default. You will need to do this for each computer you run your
# script file on. In RStudio, you can go to 'Session' -> 'Set Working Directory'
# -> 'Choose Directory', and select a folder from a drop down menu. For me, this
# looks like:
setwd("~/Desktop")



###################################################
###### Basic Data Structures and Operations  ######
###################################################


###### Comparison Operators ######
5 < 6 # 5 is less than 6: returns TRUE
5 > 6 # 5 is not greater than 6: returns FALSE
5 == 5 # 5 is equal to 5: returns TRUE
5 != 6 # 5 is not equal to 6: returns TRUE
5 <= 5 # 5 is less than or equal to 5: returns TRUE

# R will also do its best to make two quantities comparable, even if one is a
# string and the other is a number:
5345 == "5345"

# However if we assign a value to a variable, then it will compare the value
# in the variable, not the name of the variable. This is also the first time
# we have seen variables. They have have any name composed of letters, '.' and,
# '_'. Variables can store lots of stuff --as we will see in future tutorials.
# In this example, we are assigning the number 5 to the variable 'i' using the
# assignment operator '<-':
i <- 5

i == "i" # 5 is not equal to "i": returns FALSE

# Now we assign a string ("i") to the variable 'i':
i = "i"

i == "i" # "i" is equal to "i": returns TRUE


##### Creating Data and Variables in R #####

# Assign a value to a variable (remember to use no spaces or symbols other than
# . or _ in your variable name):
my_value <- 24

# Create a vector using the concatenation operator 'c()'. This is our first
# example of a variable that can hold multiple values
my_vector <- c(5,34,76,13)

# Entering the variable into your console shows you its contents
my_vector

# We can also us the ':' operator to give us all numbers in a range (in this
# case between 1 and 10):
my_vector <- 1:10

# We can technically also use the '=' operator to assign values to variables,
# but this is typically considered bad form, because it is easy to confuse with
# the '==' operator. For now, lets stick to using '<-':
my_vector = 1:10

# We can index (get) elements of a vector by giving the position (as a positive
# integer) of the element in the vector. Note that all indexing in R starts from
# 1 and not zero, as in some other programming languages.
my_vector[5]

# In addition to entering the variable name into the R console, we can also take
# a look at what is stored in a variable by using either the 'print()' or
# 'cat()' functions, which are built right into R:
print(my_vector)
cat(my_vector)

# Another very useful function, 'length()' tells us the number of elements in a
# vector or list object (don't worry, we haven't gotten to lists yet):
length(my_vector)

# We can also create a matrix (can only hold one kind of data -- usually
# numbers) by using the matrix() function:
my_matrix <- matrix(data = c(1:25), # what gets stored in the matrix
                    ncol = 5, # the number of columns
                    nrow = 5, # the number of rows
                    byrow = TRUE) # how the input should be added to the matrix.

# We can index the elements of matrices in a variety of ways:
my_matrix[1,]
my_matrix[,5]
my_matrix[3,3]

# Lets make some fake data!
student_id <- c(1:10)
grades <- c("A","B","C","A","C","F","D","B","B","A")
# The rep() function repeats some value for a specified number of times.
class <- c(rep(0,times = 5),rep(1,times = 5))
free_lunch <- rep(TRUE,times = 10)


# Now we can put the vectors we created above together to make a 'data.frame',
# one of the most commonly used data types in R. Data frames very useful because
# they can hold multiple types of values (e.g. text and numbers), and because
# columns are easy to index by name using the '$' operator (see below). They
# are also the most common input for most statistical packages and methods in R.
# Make sure to use the 'stringsAsFactors = FALSE' argument so that we do not
# turn our letter grades into factor variables (a kind of categorical variable
# that R likes). This is just generally true (ALWAYS DO THIS). Factor variables
# are like the dinosaurs from Jurassic Park, they refuse to die out.
my_data <- data.frame(student_id,
                      grades,
                      class,
                      free_lunch,
                      stringsAsFactors = FALSE)

# We can set column names if we like:
colnames(my_data) <- c("Student_ID", "Grades","Class","Free_Lunch")

# We can also set row names
rownames(my_data) <- LETTERS[11:20]


### Searching through data and taking subsets ###

# The 'which()' function lets us identify observations that meet a certain
# criteria. This example also introduces the '$' operator which lets us access a
# variable in a data frame by name:
which(my_data$Grades == "A")

# Now we can create a new dataset that only includes A or B students by saving
# the indexes of the A and B students and then using them to extract a subset of
# the full data:
A_students <- which(my_data$Grades == "A")
B_students <- which(my_data$Grades == "B")
students_for_reduced_dataset <- c(A_students, B_students)

# We now use the vector to index only the rows we want, and extract them, saving
# them to a new object. Note that we index by [row,column], and if we leave one
# of these fields blank, then we take the entire row (or column).
reduced_data <- my_data[students_for_reduced_dataset,]

# When we are subsetting data, we can use the c() function to take arbitrary
# subsets of a matrix:
my_data[c(1:5,7,9),c(2,4)]


### List Data Structures ###

# To create an empty list, object, we actually use the 'vector()' function.
my_list <- vector(mode = "list", length = 10)

# We can also create a list from objects. Not that we can name each entry in a
# list just as we would with a data.frame:
my_list <- list(num = 10,
                animal = "dog",
                vec = c(1:10),
                dat = my_data)

# We can also glue lists onto the end of other lists using the 'append()'
# function
my_list <- append(my_list, list(list(27,14,"cat")))

# Lets look at the contents of our list:
print(my_list)

# And extract one of the elements using [[]] indexing:
my_second_data_frame <- my_list[[4]]


##################################
######      Data I/O        ######
##################################

# In this section, we are going to write our school children data to a .csv file
# and then read the data back in to another R object. We are also going to learn
# how to save R objects in R's native binary format (very space efficient).

# We make use of the 'write.csv()' function here. Make sure you do not write row
# names, this can really mess things up as it adds an additional column and is
# generally confusing:
write.csv(x = my_data,
          file = "school_data.csv",
          row.names = FALSE)

# Now we are going to read the data back in from the .csv file we just created.
# You should make sure that you specify the correct separator (the 'write.csv()'
# function defaults to using comma separation). I also always specify
# 'stringsAsFactors = FALSE' to preserve any genuine string variables I read in.
school_data <- read.csv(file = "school_data.csv",
                        stringsAsFactors = FALSE,
                        sep = ",")

## Excel Data ##
# We will need to load a package in order to read in excel data. This will
# extend the usefulness of R so that we can now read in .xlsx files among other
# types.

# First we need to download the 'rio' package, we can either do this manually
# or by using the package manager in base R. You can check this package out by
# visiting the development Github page: https://github.com/leeper/rio. You need
# to make sure you select 'dependencies = TRUE' so that you download the other
# packages that your package depends on, otherwise it will not work! Here is the
# manual way of installing an R package:
install.packages("rio", dependencies = TRUE)

# Now we have to actually load the package so we can use it. We do this using
# the library() command:
library(rio)

# Write our school children data to an .xlsx file:
export(my_data, "school_data.xlsx")

# Now we can read in our data from the excel file:
excel_school_data <- import("school_data.xlsx")

### Stata Data ###

# Write data to a .dta file:
export(my_data, "school_data.dta")

# Then read it back in:
stata_school_data <- import("school_data.dta")


## RData files ##

# Finally we may want to read and write our data to an .RData file that can hold
# everything in our workspace, or just a single variable. This is a very good
# strategy for saving all of your files after a day of working so you can pick
# back up where you left off:

# Save one object:
save(my_data, file = "Object.RData")

# Save just a few objects:
save(list = c("my_data", "reduced_data"), file = "Two_objects.RData")

# Save your whole working directory
save(list = ls(), file = "MyData.RData")

# Now lets test it out by clearing our whole workspace:
rm(list = ls())

# Now we can load the data back in! It is good practice to set our working
# directory again first (remember to change this to the folder location where
# you downloaded the workshop materials or saved this script file!):
setwd("~/Desktop")

# Load in the two objects
load(file = "Two_objects.RData")

# Load in everything
load(file = "MyData.RData")
