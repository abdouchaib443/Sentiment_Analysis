# Sentiment_Analysis

# here's an explanation of the R code:

his R code performs several data analysis and visualization tasks on a dataset of consumer complaints.

The code starts by loading several libraries, including tidyverse, tidytext, dplyr, wordcloud, shiny, and DT. These libraries provide tools for data manipulation, text analysis, visualization, interactive data exploration, and data tables.

<img width="545" alt="Screenshot 2023-03-09 at 10 10 49 PM" src="https://user-images.githubusercontent.com/59566162/224225397-6e67251a-dbe4-40a6-8aa9-b98490d9ed17.png">

Then, the code sets the working directory and reads a CSV file of consumer complaints data into a dataframe named df_1. The code saves a serialized version of this dataframe as an RDS file and reads it back into a new dataframe named df. The code selects specific columns from df_1 and drops any rows with missing values to create a new dataframe named df_2.

Next, the code uses tidytext to tokenize the Company.response.to.consumer column of df_2, removes stop words, and joins the resulting tokens with a sentiment lexicon to get a count of positive and negative words. The code then creates a bar plot of the top 10 words for each sentiment category using ggplot.

The code also creates a comparison cloud of the most frequent words and their sentiment using the Bing sentiment lexicon.

# The Word-Cloud : 

<img width="545" alt="Screenshot 2023-03-09 at 9 44 50 PM" src="https://user-images.githubusercontent.com/59566162/224225405-60b57ff7-7ccd-49f5-a130-e95ea8e78250.png">



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
