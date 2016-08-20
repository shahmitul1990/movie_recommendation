#### Movie Recommendation

## Loading the data
movies <- read.table("movieLens.txt", header = FALSE, sep = "|", quote = "\"")

## Taking a look at the structure of the data
str(movies)

## Naming the columns
colnames(movies) <- c("ID", "Title", "ReleaseDate", "VideoReleaseDate",
                      "IMDB", "Unknown", "Action", "Adventure", "Animation", 
                      "Children","Comedy", "Crime", "Documentary", "Drama", 
                      "Fantasy","FilmNoir", "Horror", "Musical", "Mystery", 
                      "Romance","SciFi", "Thriller", "War", "Western")

## Looking at the structure again
str(movies)

## Removing the variables ID, Release date, Video release date and IMDB variables
movies$ID <- NULL
movies$ReleaseDate <- NULL
movies$VideoReleaseDate <- NULL
movies$IMDB <- NULL

## Removing duplicate rows
movies <- unique(movies)

## Taking a look at the structure 
str(movies)

## Calculating distances 
distances <- dist(movies[2:20], method = "euclidean")

## Clustering movies
clusterMovies <- hclust(distances, method = "ward.D")

## Plotting Dendogram
plot(clusterMovies)

## Assigning data points to clusters
clusterGroups <- cutree(clusterMovies, k = 10)

## Figuring out what clusters look like

## Action genre
tapply(movies$Action, clusterGroups, mean)

## Subsetting the movie Men in Black
subset(movies, Title == "Men in Black (1997)")

## Cluster of "Men in Black"
clusterGroups[257]

## Creating cluster 2 dataset
cluster2 <- subset(movies, clusterGroups == 2)

## Looking at the first 10 titles in this group
cluster2$Title[1:10]
