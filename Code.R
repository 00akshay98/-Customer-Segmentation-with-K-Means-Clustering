# K-Means Clustering

# Importing the dataset
dataset <- read.csv('Mall_Customers.csv')

X = dataset[4:5]
plot(X)
# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(X, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

# Applying K-Means to the Mall dataset
set.seed(29)
kmeans = kmeans(x = X, centers = 5, iter.max=200, nstart=25)
y_kmeans = kmeans$cluster

# Visualising the clusters
#install.packages("cluster")
library(cluster)
clusplot(X,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = TRUE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
y_kmeans <- as.data.frame(y_kmeans)
write.csv(y_kmeans, file="k-meanReslut.csv")
