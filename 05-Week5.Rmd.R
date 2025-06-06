---
  title: "05-Week5.Rmd"
author: "M. Armstrong"
date: "2025-04-07"
output:
  bookdown::html_book:
  toc: yes
css: toc.css
---
  ```{r setupq5, include=FALSE}
knitr::opts_chunk$set(comment = "#>", echo = TRUE, fig.width=6)
```
# Week 5- Welcome to the R environment!

This lesson is modified from materials from Serena Caplins and from the STEMinist_R lessons produced by several UC Davis graduate students and which can be found [here](https://github.com/ecalfee/STEMinist_R.git). 

You can download the R files for this week via wget in the terminal with the following link:

```{html
wget https://raw.githubusercontent.com/BayLab/MarineGenomicsData/main/week4.tar.gz
```

this is a commpressed file which can be uncompressed via:
```
tar -xzvf week4.tar.gz

```
You can now open R and load in the R_Day_1_Lesson.R file. This is the script that we will work out of for the rest of the week. You can see it contains many commented sections that begin with a `#`. This allows you to add comments to your code, explaining what you are doing for each line of code. Commenting code is very important! It explains to someone else what your code does, and can even be useful when you revisit your own code after a few weeks/months/years. Be nice to your future self, comment your code. 

The next section contains the commented out code and the script that is run in R in a format that is more easily readable on a website.

## Lesson 1: Orientation to R

R can be used for basic arithmetic:

```{r , echo=T}

5+10+23

```


It can also store values in variables:

You can assign an object using an assignment operator `<-` or  `=`.
```{r , echo=T}

number<-10

numbers<-c(10, 11, 12, 14, 16)
```

You can see your assigned object by typing the name you gave it.
```{r , echo=T}

number

numbers

```

Objects can be numbers or characters:
```{r , echo=T}

cat<-"meow"
dog<-"woof"


```


We can use colons to get sequences of numbers:
```{r , echo=T}

n<-1:100

```

Vectors can also include characters (in quotes): 
`c()`=concatenate, aka link things together!
```{r , echo=T}

animals<-c("woof", "meow", "hiss", "baa")

```

## Manipulating a vector object 

We can get summaries of vectors with `summary()`
```{r , echo=T}

summary(n)

```

We can see how long a vector is with `length()`
```{r , echo=T}

length(n)

```  
You can use square brackets `[]` to get parts of vectors.

```{r , echo=T}

n[50]

```  


## Operations act on each element of a vector:
```{r , echo=T}

# +2
numbers+2

# *2
numbers*2

# mean
mean(numbers)

# ^2
numbers^2

# sum
sum(numbers)

```  


## Operations can also work with two vectors:
```{r , echo=T}

#define a new object y
y<-numbers*2

# n + y
numbers + y

# n * y
numbers * y

```

## A few tips below for working with objects:

We can keep track of what objects R is using, with the functions `ls()` and `objects()`
```{r , echo=T}
ls()
objects() #returns the same results as ls() in this case. because we only have objects in our environment.

# how to get help for a function; you can also write help()
?ls

# you can get rid of objects you don't want

rm(numbers)

# and make sure it got rid of them
ls()

```
## Practice R Operations
> ## EXERCISE 1.1 # 


> 01. Open Rstudio and perform an arithmetic calculation in the command line.

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
#this can be whatever you decide to do!

5*134
```
</p>
</details>


> 02. Create a numeric vector in the command line containing:
> + the numbers 2, 9, 3, 8, and 3 and assign this vector to a global variable x. 
> + Perform arithmetic with x. 
> + Convince yourself R works as a calculator, and knows order of operations. 
> + Multiply x by 10, and save the result as a new object named y
> + Calculate the difference in the sum of the x vector and the sum of the y vector
        
<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}

x <- c(2, 9, 3, 8, 3)

x * 20

x + 4 * 24

y <- x * 10

sum(x) - sum(y)
```


</p>
</details>        


> 03. Call the help files for the functions ls() and rm()
> + What are the arguments for the ls() function?
> + What does the 'sorted' argument do? 

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
?ls

#From the help file: 	sorted is a logical indicating if the resulting character should be sorted alphabetically. Note that this is part of ls() may take most of the time.
```
</p>
</details>



## 1.2 Characterizing a dataframe


We'll now move from working with objects and vectors to working with dataframes:

* Here are a few useful functions: 
  + install.packages()
  + library()
  + data()
  + str()
  + dim()
  + colnames() and rownames()
  + class()
  + as.factor()
  + as.numeric()
  + unique() 
  + t()
  + max(), min(), mean() and summary()


We're going to use data on sleep patterns in mammals. This requires installing a package (ggplot2) and loading the data
 
Install the package `ggplot2`. This only has to be done once and after installation we should then **comment out the command to install the package with a #.**

```{r, echo=T}

#install.packages("ggplot2")

#load the package

library (ggplot2)
```
 
Load the data (it's called msleep).

```{r, echo=T}

data("msleep")
```


There are many functions in R that allow us to get an idea of what the data looks like. For example, what are it's dimensions (how many rows and columns)? 

```{r, echo=T}

# head() -look at the beginning of the data file
# tail() -look at the end of the data file

head(msleep)
tail(msleep)

# str()
str(msleep)
```
dim(), ncol(), nrow()- dimensions, number of columns, number of rows
colnames(), rownames() - column names, row names

 Rstudio also allows us to just look into the data file with `View()`


## How to access parts of the data:

We can also look at a single column at a time. There are three ways to access this: $, [,#] or [,"a"]. 

**Quick Tip:**
Think about "rc cola" or "remote control car" to remember that [5,] means fifth row and [,5] means fifth column!

Each way has it's own advantages:
```{r, echo=T}

msleep[,3]
msleep[, "vore"]
msleep$vore

```

Sometimes it is useful to know what class() the column is:
```{r, echo=T}

class(msleep$vore)

class(msleep$sleep_total)
```

We can also look at a single row at a time. There are two ways to access this: 1. by indicating the row number in square brackets next to the name of the dataframe `name[#,]` and by calling the actual name of the row (if your rows have names) `name["a",]`.
```{r, echo=T}

msleep[43,]
msleep[msleep$name == "Mountain beaver",]

```

We can select more than one row or column at a time:
```{r, echo=T} 
 # see two columns

msleep[,c(1, 6)]

 # and make a new data frame from these subsets

subsleep<-msleep[,c(1, 6)]

```
But what if we actually care about how many **unique** things are in a column?
```{r, echo=T}
 # unique()
unique(msleep[, "order"])

 # table()
table(msleep$order)

 # levels(), if class is factor (and if not we can make it a factor)
levels(as.factor(msleep$order))

```
## Data Manipulation

If your data is transposed in a way that isn't useful to you, you can switch it. Note that this often changes the class of each column!

In R, each column must have the same type of data:
```{r, echo=T}
 # t()

tr_msleep<-t(msleep)

str(tr_msleep)

```
It's important to know the class of data if you want to manipulate it. For example, you can't add characters.
`msleep` contains several different types of data. 

Some common classes are: factors, numeric, integers, characters, logical
 
```{r, echo=T}

 # class()

class(msleep)

 # str()

str(msleep)

```

Often we want to summarize data. There are many ways of doing this in R:
```{r, echo=T}

 # calculate mean() of a column
mean(msleep$sleep_total)

 # max()
max(msleep$sleep_total)

 # min()
min(msleep$sleep_total)

 # summary()
summary(msleep$sleep_total)
```

Sometimes, the values we care about aren't provided in a data set. When this happens, we can create a new column that contains the values we're interested in:

```{r, echo=T}

  # what if what we cared about was our sleep_total/sleep_rem ratio?
  # add a sleep_total/sleep_rem ratio column to our msleep dataframe with $
msleep$total_rem<-msleep$sleep_total/msleep$sleep_rem

  # look at our dataframe again. It now contains 12 columns, one of them being the one we just created.
head(msleep)

```


## Practice exploring a dataframe
> ## EXERCISE 1.2 

> Reminder of those useful commands: dataframename[row , col], str(), dim(), nrow(), unique(), length(), rownames(), summary(), min(), max(), mean(), range(), levels(), factor(), as.factor(), class(), ncol(), nrow(), table(), sum(), quantile(), var()

> We'll use the built-in 'iris' dataset. the command: `data(iris)` # this loads the 'iris' dataset. You can view more information about this dataset with `help(iris)` or `?iris`


> 01. How many rows are in the dataset?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
data(iris)

nrow(iris)
```
</p>
</details>
&nbsp;


> 02. What are three distinct ways to figure this out? 

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
#nrows
#str
#dim

```
</p>
</details>
&nbsp;

> 03. How many species of flowers are in the dataset?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}

levels(iris$Species)

```
</p>
</details>
&nbsp;


> 04. What class is iris?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
class(iris)
```
</p>
</details>
&nbsp;


> 05. How many columns does this data frame have? What are their names?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>
```{r, echo=T}
colnames(iris)

```

</p>
</details>
&nbsp;

> 06. What class did R assign to each column?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>
```{r, echo=T}
str(iris)

```
</p>
</details>
&nbsp;


> 07. Assign the first flower's petal's width and length to new objects called setosa1.petalwidth and setosa1.petallength

<details><summary><span style="color: blue;">Solution</span></summary>
<p>
```{r, echo=T}

setosa1.petalwidth<-iris[1,2]

setosa1.petallength<-iris[1,3]

```
</p>
</details>
&nbsp;

> 08. Calculate the approximate area of the petal of the first flower, setosa1 (assume petal area can be approximated by a rectangle).

<details><summary><span style="color: blue;">Solution</span></summary>
<p>
```{r, echo=T}

#using our premade objects
setosa1area2<-setosa1.petalwidth*setosa1.petallength

```
</p>
</details>
&nbsp;


> 09. Calculate the petal area of each flower in the iris dataset and assign this to a new column named PetalArea.

<details><summary><span style="color: blue;">Solution</span></summary>
<p>
```{r, echo=T}
iris$PetalArea<-iris$Petal.Length*iris$Petal.Width

```
</p>
</details>
&nbsp;


> 10. What is the maximum sepal length of the irises?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
max(iris$Sepal.Length)

```
</p>
</details>
&nbsp;


> 11. What is the average sepal length among all flowers in the dataset?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>
```{r, echo=T}
mean(iris$Sepal.Length)

```
</p>
</details>
&nbsp;


> 12. How about the minimum and median sepal length? 

<details><summary><span style="color: blue;">Solution</span></summary>
<p>
```{r, echo=T}

min(iris$Sepal.Length)
median(iris$Sepal.Length)

```

</p>
</details>
&nbsp;
          
           

We'll continue with this material on Thursday!

## 1.3 Subsetting datasets & logicals


A few useful commands: equals `==`,  does not equal `!=`, greater than `>`, less than `<`, and `&`, and a pipe which can also indicate "and" `|`.

Reminder there are two assignment operators in R `<-` and a single equals sign `=`. The one you use really depends on how you learned to use R, and are otherwise equivalent.

**Logical conditions vs. assignment operators:**

Logical values of TRUE and FALSE are special in R. What class is a logical value?

```{r, echo=T}
TRUE
FALSE

# what class is a logical value?

class(TRUE)

```
Logical values are stored as 0 for FALSE and 1 for TRUE. Which means you can do math with them!

```{r, echo=T}

TRUE + 1
FALSE + 1

sum(c(TRUE,TRUE,FALSE,FALSE))

!TRUE

!c(TRUE,TRUE,FALSE,FALSE)
```


Logicals will be the output of various tests:

```{r, echo=T}

1 == 1
1 == 2

 # does not equal

1 != 1
1 != 2

 # greater than

1 > 1
1 >= 1

 # less than

1 < 3

 # combining logical conditions with and (&), or(|)

1 == 1 & 2 == 2
1 == 1 & 1 == 2
1 == 1 | 1 == 2
 
 # we can take the opposite of a logical by using !

!TRUE
```

This is very useful because we can use logicals to query a data frame or vector.
```{r, echo=T}

 # Which numbers in 1:10 are greater than 3?

1:10 > 3

 # How many numbers in 1:10 are greater than 3?

sum(1:10 > 3)

# in our msleep data frame, which species have total sleep greater than 18 hours?
# reload the msleep data with library(ggplot2) and data(msleep) if you need to

msleep[,"sleep_total"]>18

 # Using which() to identify which rows match the logical values (TRUE) and length to count how many species there are

which(msleep[,"sleep_total"]>18)  #22 37 43 62 --> the rows that contain organisms that sleep more than 18 hrs

length(which(msleep[,"sleep_total"]>18)) #4 --> number of species that sleep more than 18 hrs 

 # which four species are these?

msleep[which(msleep[,"sleep_total"]>18),]

# what if we only want to see the bats that sleep more than 18 hours per 24 hour period?

msleep[which(msleep[,"sleep_total"]>18 & msleep[,"order"] == "Chiroptera"),]

```
## Practice Subsetting datasets/logicals

> ## EXERCISE 1.3 indexing by logical statements

> A few useful commands:  "==", "!=", ">", "<", "&", "|", sum(), which(), table(), !

> 1. Create your own logical vector with three TRUEs and three FALSEs

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}

a = c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE)
a ## let's print to screen and make sure it is stored in this variable

```
</p>
</details>

> 2. Produce a vector of the index number of the `TRUE` values

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
which(a)  ## which gives you the index of TRUE values automatically
which(a == TRUE)   ## but sometimes it's reassuring to state exactly what you're doing

```
</p>
</details>

> 3. Produce a second vector which indexes the numbers of the falses

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
which(!a)
which(a == FALSE)

```
</p>
</details>

>  Go back to the iris dataset, which can be loaded with data(iris)

> 4. How many irises have sepals less than 5.5 cm?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
data(iris)  ## this reloads the data set in case you've closed R since using iris
sum(iris[,'Sepal.Length']<5.5)  ## remember TRUE's are 1 and FALSE's are 0
length(which(iris[,'Sepal.Length']<5.5))  ## here, which() will only return the index of TRUE values, so we're counting how many there are


```
</p>
</details>

> 5. Which iris individual has the largest petal length? What is the width of it's petal? 

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
max(iris[,'Petal.Length'])  ## this gives us the length of the longest petal
which(iris[,'Petal.Length'] == max(iris[,'Petal.Length']))  ## this gives us the index of the individual with the longest petal
iris[,'Petal.Width'][which(iris[,'Petal.Length'] == max(iris[,'Petal.Length']))] ## now we're subsetting the Petal.Width column by the index of the individual with the longest petal
## another way to do this would be to use the index of the individual with the longest petal to pick rows, and the Petal.Width name to pick columns and subset the entire data frame
iris[which(iris[,'Petal.Length'] == max(iris[,'Petal.Length'])) , 'Petal.Width']

```
</p>
</details>

> 6.  How many of the irises are in this dataset belong to the species versicolor?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
sum(iris[,'Species']=='versicolor')
table(iris[,'Species']) ## this gets us all three species

```
</p>
</details>

> 7. How many irises have petals longer than 6cm?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
sum(iris[,'Petal.Length'] > 6)
```
</p>
</details>

> 8. Create a vector of species name for each iris with sepals longer than 6cm.

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
iris[,'Species'][iris[,'Sepal.Length']>6]
iris[iris[,'Sepal.Length']>6, 'Species'] ## alternatively, we can put the logical vector in the row part, and Species in the column part, to get a vector back
```
</p>
</details>

> 9. How many irises have sepals shorter than 5cm, but wider than 3cm?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
sum( iris[,'Sepal.Length'] < 5 & iris[,'Sepal.Width'] > 3 )
```
</p>
</details>

> 10. How many irises have petals narrower than 0.2cm or shorter than 1.5cm?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
sum( iris[,'Petal.Width'] < 0.2 | iris[,'Petal.Length'] < 1.5 )
```
</p>
</details>

> 11. What is the average width of *setosa iris* sepals that are longer than 5cm?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
mean( iris[,'Sepal.Width'][iris[,'Sepal.Length'] > 5][iris[,'Species']=='setosa']) ## convince yourself the second part is a logical vector that subsets iris[,'Sepal.Width']
mean( iris[iris[,'Sepal.Length'] > 5, 'Sepal.Width'][iris[,'Species']=='setosa']) ## again, we can alternatively subset using logical vectors in the row position
```
</p>
</details>

> 12. What is the difference between the longest and shortest petal lengths of the species *virginica*?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
max(iris[,'Petal.Length'][iris[,'Species']=='virginica']) - min(iris[,'Petal.Length'][iris[,'Species']=='virginica'])
```
</p>
</details>
> 13. What proportion of flowers in the dataset have petals wider than 1cm?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
sum(iris[,'Petal.Width'] > 1 ) / nrow(iris) ## here, we're counting up how many are wider than 1 cm, and dividing by the total number of flowers to get a proportion
```
</p>
</details>

> 14. Create a new column within your dataframe, called sepalCategory, and set all values equal to 'long'
>       Subset short values of this column, and set their values to 'short'
>       (Short sepals are those less than 5.5 cm)
>       How many plants with short sepals are there? How many long?

<details><summary><span style="color: blue;">Solution</span></summary>
<p>

```{r, echo=T}
# new column for long
iris[,'sepalCategory'] = 'long'  ## this sets ever entry in the column equal to 'long'
# new column for short (< 5.5 cm)
iris[,'sepalCategory'][iris[,'Sepal.Length']<5.5] = 'short'  ## this sets only those entries that match our condition to 'short'
# how many plants with short sepals are there? How many long?
table(iris[,'sepalCategory'])

```
</p>
</details> 