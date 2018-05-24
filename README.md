# ISSR Data Management and Web Scraping Workshops: 2018

This Git repo is home to all of the materials you will need if you are taking either or both of the following ISSR workshops: 

* **Data Management in R** (May 29-30, 2018).
* **Practical Web and Text Scraping** (Mat 31- June 1, 2018).

You can email me at <mdenny@psu.edu> or <matthewjdenny@gmail.com> with any questions. There are lots of additional materials available on my website at: <http://www.mjdenny.com/teaching.html>, but you will only need to look at the stuff linked to from this page in oder to be successful in this course. To download all of the materials associated with this course, you will want to start by downloading a GUI client for Git. 

* For Windows: <https://windows.github.com/>
* For Mac: <https://mac.github.com/>
* For Linux, you may have to rely on the command line, although <https://git-scm.com/downloads/guis> has some options (depending on your distro).

You will then want to `clone` this repo onto your computer using either the 

    https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018.git

link and your client or by clicking the "Clone in Desktop" button on the right hand side of the page. If you want to directly edit the files posted here and track your changes, you can copy individual files into another directory and create your own Git repo with the files in it. If you are not sure what any of the above meant, don't worry!  We will go over using Github at the beginning of the first workshop, so there is no need to spend too much time trying to figure Github out. If you are skipping the first two days, then just check out this  [**[Github pictorial]**](http://www.mjdenny.com/Data_Science_Tools.html). Welcome to the workshop!

## Data Management in R

* **Description:**  In this two day short course, participants will be introduced to core data management concepts and techniques using the R programming language. We will focus on reading data into R (and writing data from R) from a wide variety of sources, and manipulating and cleaning it for use in statistical and descriptive analyses. We will place an emphasis on providing participants with the skills to deal with poorly formatted source data, and multiple datasets at once. The workshop will also include a mini-unit on social network data management, as well as a mini-unit on producing  plots and graphics. 

* **Goals:**  By the end of the workshop, participants should possess the basic skills necessary to perform most data management tasks they are likely to encounter over the course of a research project intended for publication as a scholarly journal article.
* **Prerequisites:** No previous experience with R is required, and a number of tutorial resources will be provided before the beginning of the course. However, participants are expected to have some very basic experience working with data using software such as R, Stata, SAS, SPSS or Excel. 

### Schedule

This is a draft outline of the workshop schedule, it will likely change over the course of the workshop depending on how fast we end up going.

#### Before the workshop
Please download R and RStudio before the workshop. I provide dicrections below, as well as a screen-cast tutorial. If you have never used R before, you may want to look through some of the introductory examples listed below: 

* If you are using a Windows computer, start by downloading and installing RTools. It is very important that you do this first. If you already have R installed on your computer, download RTools and then reinstall R. You can download RTools here: <https://cran.r-project.org/bin/windows/Rtools/index.html> You will want to get "RTools35.exe" (or the newest version). You will also want to check the box to edit your system PATH variable while you are installing RTools. You can see an example ofhos this might look (although you shuld expect the screen to have a different path variable on your computer) by looking at the top picture in this post: <https://github.com/stan-dev/rstan/wiki/Install-Rtools-for-Windows>. Again, you will need to do this before installing R on a windows computer.
* Download R: <https://cran.r-project.org/>. Right at the top of the page, you will see links to download the latest version of R (currently 3.5.0, but there may be a newer version by the time you download it).
* Download RStudio: <https://www.rstudio.com/products/rstudio/download/>. Not that as a researcher, you can select the free license.
* This section of Quick R provides a basic overview of the R interface. You can navigate between pages by clicking on the links on the top left -- <http://www.statmethods.net/interface/index.html>. I still end up finding useful examples here, but do not find the website to be in the most conversational form. This is a useful starting point for basic example code, particularly for plotting and statistical tests.
* A nice place to start learning R interactively is [Swirl](http://swirlstats.com/). Note that this is probably the best "teach yourself" option for just messing around with code, but you will want to actually get R installed on your computer to do serious work. 

To make things easier, I have created a video tutorial that will walk you through installing R and RStudio on your computer. You can check it out by clicking on the video below:

[![Downloading and Installing R and RStudio](https://img.youtube.com/vi/0FWXWnPuxrs/0.jpg)](https://www.youtube.com/watch?v=0FWXWnPuxrs "Click on this screenshot to watch the video! ")


#### Tuesday 5/29/18

1. **9:00-10:00** We will go over high level materials including downloading and installing R, setting up RStudio and Github, and good project management habits. Follow-up materials: [**[R Power User Tutorial]**](http://www.mjdenny.com/Data_Science_Tools.html) 
2. **10:00-10:10** Break
3. **10:10-12:00** Introduction to R programming. [**[Basic R Programming]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Basic_R_Programming.R), 
[**[Basic Datastructures]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Basic_Datastructures.R)
4. **12:00-1:00** Lunch
5. **1:00-3:00** More R programming: [**[Looping and Conditionals]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Looping_and_Conditional_Statements.R), [**[Data I/O and R Packages]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Data_IO_and_Packages.R)
6. **3:00-3:10** Break.
7. **3:10-4:00** Functions  [**[Functions]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Functions.R), [**[Additional Functions]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Additional_Functions.R).
8. Overview of materials for today: [**[R Tutorial]**](http://www.mjdenny.com/R_Tutorial.html) 
9. **Homework** First Homework assignment. [**[Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/R_Programming_Assignment_1.R)


#### Wednesday 5/30/18

1. **9:00-10:00** Functions  [**[Functions]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Functions.R), [**[Additional Functions]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Additional_Functions.R).
2. **10:00-10:10** Break.
3. **10:10-12:00** Managing multiple datasets. [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Managing_Multiple_Datasets.R) 
4. **12:00-1:00** Lunch  
5. **1:00-2:00** Mini unit: basic plotting  [**[Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Basic_Plotting.R).
6. **2:00-3:00** Mini unit: producing publication quality plots and graphics (As time permits)  [**[Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Publication_Quality_Plots.R).
7. **3:00-3:10** Break.
8. **3:10-4:00** Mini unit: social network data management (time permitting) [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Preparing_Network_Data_in_R.R), [**[Online Tutorial]**](http://www.mjdenny.com/Preparing_Network_Data_In_R.html) 
9. **Homework** Second Homework assignment. [**[Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Cleaning_Data_Assignment_2.R)




## Practical Web and Text Scraping

* **Description:** In this two day short course, participants will learn how to efficiently automate the process of collecting data from large numbers of websites and text files using R. We will cover practical and computational issues associated with scraping large amounts of data in a timely manner, as well as potential legal issues, and how to address them. Additionally, I will focus on giving participants the skills to work at a low level with html and text data once it has been collected. This workshop will include a mini-unit on text processing in R, as well as a mini-unit on scraping Twitter using R.  
* **Goals:** By the end of the workshop, participants should possess the basic skills necessary to scrape a large amount of web or text data and extract useful information from those data.
* **Prerequisites:** No previous experience with web scraping is required, but participants are expected to be familiar with data management in R at the level covered in the "Data Management in R" short course. These two courses are designed to work in sequence, however, if a participant has a strong R programming background, they should be prepared to step directly into the course.

### Schedule

This is a draft outline of the workshop schedule, it will likely change over the course of the workshop depending on how fast we end up going.

#### Before the workshop

You should be comfortable with R up to the level presented in the **Data Management in R Workshop** shown above.  Also, if you have not already done so, please download R and RStudio (or update your installation to the newest version):

* Download R: <https://cran.r-project.org/>
* Download RStudio: <https://www.rstudio.com/products/rstudio/download/>

#### Thursday 5/31/18

1. **9:00-11:00** Introduction to text processing in R [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Working_with_Text_Data.R), [**[Tutorial]**](http://www.mjdenny.com/Text_Processing_In_R.html).  
2. **11:00-11:10** Break
3. **11:10-12:00** Basic web scraping in R:  [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Basic_Web_Scraping.R). 
4. **12:00-1:00** Lunch
5. **1:00-2:00** Basic web scraping in R:  [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Basic_Web_Scraping.R). 
6. **2:00-2:10** Break
7. **2:10-4:00** Advanced web scraping [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Advanced_Web_Scraping.R)
8. Time and interest permitting, we can go over some advanced topics including dealing with XML data.

#### Friday 6/1/18

1. **9:00-11:00** Scraping Twitter:  [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Scraping_Twitter.R), [**[Helpful Tutorial]**](https://github.com/SMAPPNYU/smappR), [**[StreamR Github]**](https://github.com/pablobarbera/streamR).
2. **11:00-11:10** Break
3. **11:10-12:00** Text processing and analysis using Quanteda. [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Text_Processing_and_Analysis.R)
4. **12:00-1:00** Lunch
5. **1:00-2:00** Text processing and analysis using Quanteda. [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Text_Processing_and_Analysis.R) 
6. **2:00-2:10** Break.
7. **2:10-4:00** Synthesis exercise: [**[Script]**](https://github.com/matthewjdenny/ISSR_Data_Management_Web_Scraping_2018/blob/master/Scripts/Scraping_Example.R).
8. Time and interest permitting, we can cover advanced topics in text processing.

## Resources

* A nice place to start learning R interactively is [Swirl](http://swirlstats.com/).
* Quick-R has a bunch of easy to read tutorials for doing all sorts of basic things -- <http://www.statmethods.net/>.
* Hadley Wickham wrote a book that covers a bunch of advanced functionality in R, titled **Advanced R** -- which is available online for free here -- <http://adv-r.had.co.nz/>.
* Hadley Wickham has an R package `rvest` for web scraping that is detailed in this [blog post](https://blog.rstudio.org/2014/11/24/rvest-easy-web-scraping-with-r/).
* A blog post by Charles Dimaggio that I have referred to in the past: [blog post](http://www.columbia.edu/~cjd11/charles_dimaggio/DIRE/styled-4/styled-6/code-13/).
* Another blog post by Zev Ross that I have referred to in the past: [blog post](http://zevross.com/blog/2015/05/19/scrape-website-data-with-the-new-r-package-rvest/).
