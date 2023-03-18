# IMDB-MOVIE-ANALYSIS-
This project aims to carry out the in-depth analysis of IMDB movie dataset. SQL and Excel are used to draw insights,

You are required to provide a detailed report for the below data record mentioning the answers of the questions that follows:

Cleaning the data:: This is one of the most important step to perform before moving forward with the analysis.(Dropping columns, removing null values, etc.)
Task: Clean the data

Movies with highest profit: Create a new column called profit which contains the difference of the two columns: gross and budget. 
Task: Find the movies with the highest profit?
Top 250: Create a new column IMDb_Top_250 and store the top 250 movies with the highest IMDb Rating (corresponding to the column: imdb_score). Also make sure that for all of these movies, the num_voted_users is greater than 25,000.

Extract all the movies in the IMDb_Top_250 column which are not in the English language and store them in a new column named Top_Foreign_Lang_Film. 
Task: Find IMDB Top 250
Best Directors: Group the column using the director_name column.

Find out the top 10 directors for whom the mean of imdb_score is the highest and store them in a new column top10director. 
In case of a tie in IMDb score between two directors, sort them alphabetically.
Task: Find the best directors

Popular Genres: Perform this step using the knowledge gained while performing previous steps.
Task: Find popular genres


Find the mean of the num_critic_for_reviews and num_users_for_review and identify the actors which have the highest mean.
Observe the change in number of voted users over decades using a bar chart. Create a column called decade which represents the decade to which every movie belongs to. For example, the title_year year 1923, 1925 should be stored as 1920s. Sort the column based on the column decade, group it by decade and find the sum of users voted in each decade. Store this in a new data frame called df_by_decade.
Task: Find the critic-favorite and audience-favorite actors
