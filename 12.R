#required libraries
library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization
library(plotly)

df <- USArrests
df <- na.omit(df)

df <- scale(df)
distance <- get_dist(df)

k2 <- kmeans(df, centers = 2, nstart = 25)
df %>%
  as_tibble() %>%
  mutate(cluster = k2$cluster,
         state = row.names(USArrests))

p1 <- fviz_cluster(k2, geom = "point", data = df) + ggtitle("k = 2")

