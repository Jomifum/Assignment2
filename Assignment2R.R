# Load the necessary libraries
library(DBI)
library(RMySQL)

# Connect to the database
conn <- dbConnect(
  MySQL(), 
  user = 'jose.fuentes10',               
  password = 'bc905859f24769a7',            
  host = 'cunydata607sql.mysql.database.azure.com',  
  port = 3306,                              
  dbname = 'jose.fuentes10'                
)

# Select the database
dbExecute(conn, "USE `jose.fuentes10`;")

# Describe table schema
schema <- dbGetQuery(conn, "DESCRIBE `movie_ratings`;")
print(schema)

# Query the database and fetch data into a Dataframe
df <- dbGetQuery(conn, "SELECT * FROM `movie_ratings`;")

# Print the first few rows of the dataframe
head(df)

# Summary of the data frame
summary(df)

# View the first few rows of the data frame
head(df)

# Missing Data Strategy
# Load data from SQL database
df <- dbGetQuery(conn, "SELECT * FROM movie_ratings;")

# Ensure all rating columns are numeric
df$Carlos <- as.numeric(df$Carlos)
df$Daniel <- as.numeric(df$Daniel)
df$Alex <- as.numeric(df$Alex)
df$Ronald <- as.numeric(df$Ronald)
df$Aidde <- as.numeric(df$Aidde)

# Check the structure of the data
str(df)

# Calculate row means for the relevant columns (ignoring NAs)
row_means <- rowMeans(df[, c("Carlos", "Daniel", "Alex", "Ronald", "Aidde")], na.rm = TRUE)

# Impute missing values with row means
df$Carlos[is.na(df$Carlos)] <- row_means[is.na(df$Carlos)]
df$Daniel[is.na(df$Daniel)] <- row_means[is.na(df$Daniel)]
df$Alex[is.na(df$Alex)] <- row_means[is.na(df$Alex)]
df$Ronald[is.na(df$Ronald)] <- row_means[is.na(df$Ronald)]
df$Aidde[is.na(df$Aidde)] <- row_means[is.na(df$Aidde)]

# Replace NA values with the row median for each column
df$Carlos[is.na(df$Carlos)] <- apply(df[, c("Carlos", "Daniel", "Alex", "Ronald", "Aidde")], 1, function(x) median(x, na.rm = TRUE))
df$Daniel[is.na(df$Daniel)] <- apply(df[, c("Carlos", "Daniel", "Alex", "Ronald", "Aidde")], 1, function(x) median(x, na.rm = TRUE))
df$Alex[is.na(df$Alex)] <- apply(df[, c("Carlos", "Daniel", "Alex", "Ronald", "Aidde")], 1, function(x) median(x, na.rm = TRUE))
df$Ronald[is.na(df$Ronald)] <- apply(df[, c("Carlos", "Daniel", "Alex", "Ronald", "Aidde")], 1, function(x) median(x, na.rm = TRUE))
df$Aidde[is.na(df$Aidde)] <- apply(df[, c("Carlos", "Daniel", "Alex", "Ronald", "Aidde")], 1, function(x) median(x, na.rm = TRUE))

# Check for missing values
colSums(is.na(df))

# Check the imputed data
head(df)

#The Missing Data approach: Imputation was used to handle missing data, allowing the data set to remain complete for analysis. 
#Mean imputation was applied to fill missing values with the average, providing a balanced estimate. 
#Median imputation was  used to account for skewed data, ensuring outliers didn’t distort the results. 
#This combination preserved data integrity and statistical power while addressing missing values effectively.
