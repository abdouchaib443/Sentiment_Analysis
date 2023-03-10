# Sentiment_Analysis

# here's an explanation of the R code:

This R code performs several data analysis and visualization tasks on a dataset of consumer complaints.

First of all we start by cleaning the Data !

# Data Cleaning 🧹 :

<img width="524" alt="Screenshot 2023-03-09 at 10 58 52 PM" src="https://user-images.githubusercontent.com/59566162/224227498-807576cb-4cfd-4d28-9bb0-51e0a550611b.png">

This R code is used for text preprocessing and creating a term-document matrix (TDM).

The code uses the tm package which is commonly used for text mining in R.

Here is what each line does:

corpus <- tm_map(corpus, tolower): Convert all text to lowercase.
inspect(corpus[1:5]): Inspect the first five documents in the corpus.
corpus <- tm_map(corpus, removePunctuation): Remove all punctuation marks from the text.
inspect(corpus[1:5]): Inspect the first five documents again to see the result of the previous transformation.
corpus <- tm_map(corpus, removeNumbers): Remove all numeric characters from the text.
inspect(corpus[1:5]): Inspect the first five documents again to see the result of the previous transformation.
cleanset <- tm_map(corpus, removeWords, stopwords('english')): Remove all stop words from the text using the built-in stop word list for English language.
inspect(cleanset[1:5]): Inspect the first five documents again to see the result of the previous transformation.
removeURL <- function(x) gsub('http[[:alnum:]]*', '', x): Define a function to remove URLs from the text.
cleanset <- tm_map(cleanset, content_transformer(removeURL)): Remove all URLs from the text using the previously defined function.
inspect(cleanset[1:5]): Inspect the first five documents again to see the result of the previous transformation.
tdm <- TermDocumentMatrix(cleanset): Create a term-document matrix from the cleaned text data.
tdm <- as.matrix(tdm): Convert the TDM to a matrix.
tdm[1:10, 1:20]: Inspect the first 10 terms and 20 documents of the TDM matrix.

# After Cleaning the Data :

The code starts by loading several libraries, including tidyverse, tidytext, dplyr, wordcloud, shiny, and DT. These libraries provide tools for data manipulation, text analysis, visualization, interactive data exploration, and data tables.

<img width="545" alt="Screenshot 2023-03-09 at 10 10 49 PM" src="https://user-images.githubusercontent.com/59566162/224225397-6e67251a-dbe4-40a6-8aa9-b98490d9ed17.png">

Then, the code sets the working directory and reads a CSV file of consumer complaints data into a dataframe named df_1. The code saves a serialized version of this dataframe as an RDS file and reads it back into a new dataframe named df. The code selects specific columns from df_1 and drops any rows with missing values to create a new dataframe named df_2.

Next, the code uses tidytext to tokenize the Company.response.to.consumer column of df_2, removes stop words, and joins the resulting tokens with a sentiment lexicon to get a count of positive and negative words. The code then creates a bar plot of the top 10 words for each sentiment category using ggplot.

The code also creates a comparison cloud of the most frequent words and their sentiment using the Bing sentiment lexicon.

# The Word-Cloud : 

<img width="545" alt="Screenshot 2023-03-09 at 9 44 50 PM" src="https://user-images.githubusercontent.com/59566162/224225405-60b57ff7-7ccd-49f5-a130-e95ea8e78250.png">






# Sentimental analysis Code explanation :

  <img width="524" alt="Screenshot 2023-03-09 at 10 57 03 PM" src="https://user-images.githubusercontent.com/59566162/224227233-8aaf9314-ef50-418f-95d2-3096350b4577.png">
  
 This R code performs sentimental analysis on a dataset of consumer complaints stored in a CSV file named "Consumer_Complaints.csv". The code first reads the CSV file using the read.csv function and stores it in a data frame named cdata. Then, it extracts the "Product" column from the data frame and stores it in a vector named tweets.
Next, the get_nrc_sentiment function from the syuzhet package is used to perform the sentimental analysis on the tweets vector. The function returns a data frame that contains the count of various emotions (anger, anticipation, disgust, fear, joy, sadness, surprise, and trust) for each tweet in the tweets vector.
Finally, the head function is used to display the first few rows of the resulting data frame named s. The last line of the code is invalid as ugly is not defined or declared previously.
  
  
  

# Charts :


<img width="543" alt="Screenshot 2023-03-09 at 9 31 57 PM" src="https://user-images.githubusercontent.com/59566162/224225425-691920c1-a93e-4097-96bf-783490108396.png">

<img width="543" alt="Screenshot 2023-03-09 at 9 37 39 PM" src="https://user-images.githubusercontent.com/59566162/224225433-5e030b6f-5061-475f-827b-ea332e2a4f9b.png">

<img width="543" alt="Screenshot 2023-03-09 at 9 32 07 PM" src="https://user-images.githubusercontent.com/59566162/224225438-5b6e76b5-a729-4770-8d69-7780596e7acd.png">

<img width="545" alt="Screenshot 2023-03-09 at 9 44 59 PM" src="https://user-images.githubusercontent.com/59566162/224225449-6269d83c-34f9-4da9-96e1-1a58d43ee0b2.png">

# Here is the the ShinyApp :

Finally, the code creates a shiny app that allows users to select two columns from df_2 and visualize them in a scatter plot, with an option to color-code the points by a third column. The app also includes a data table of the selected columns.

The first select input box allows the user to choose a variable to plot on the x-axis, while the second select input box allows the user to choose a variable to plot on the y-axis. The plot is then rendered using ggplot with the selected variables and an additional input, Splitby, which is not defined in the code.

<img width="911" alt="Screenshot 2023-03-09 at 9 39 15 PM" src="https://user-images.githubusercontent.com/59566162/224225601-c4086a52-330a-4111-9e50-854369eb423b.png">


Overall, this R code provides a comprehensive analysis of the consumer complaints data, including text analysis and interactive data exploration.
