#Set your working directory#
setwd("") #For example: C:/Users/Tim/Google Drive/Political Networks Course/Datasets/#

#Load the libraries you need (install them first if you need to)#
# install.packages("igraph")
# install.packages("network")
# install.packages("sna")
library()

#Load your dataset into the environment#
networkData <- 
  read.csv("",header = T,stringsAsFactors = F) 
#For example: imf_cpis.csv#

#Depending on the data structure, create a network object from the dataset loaded#
#If it's an edgelist...#

network <- 
  graph.data.frame(networkData[,1:2],
                   directed = T/F) #Only include T or F, not both#

E(network)$weight <- 
  networkData$'weight' #Include the column name of the weights vector#

#If it's an adjacency matrix...#
network <- 
  graph.adjacency(networkData, 
                  mode = "directed", 
                  weighted = T)
                  #Change to undirected if applicable, change 'weighted' to NULL if values are binary#

#Check it out!#
plot(network)