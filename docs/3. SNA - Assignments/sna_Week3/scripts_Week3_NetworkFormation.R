library(network)

#           Network Formation 
        #### check for adjacency vs edgelist 
#####
passIt <- smugCovIdx
dim(passIt)
  #####
        #### Edgelist: Network Formation
            ## NOTE: Edgelist Format
#####
            ## network data is nx2 (or more with edge attributes)
            ## first column is "From", 
            ## second column is "To"
  #####
          ### Edgelist: inspect column names
              ## inspect column names as 3rd-kth columns of network_data may include network attributes
colnames(passIt)
  #####

#####
#       Edgelist: Format DF to become a Network Obkect
#####
      ###
      passIt
#     rows: 4
#     columns: 672
#     colnames: 
              c("dnkName",#c1
              "dnkIng", #c2
              "ingType") #c3

#Depending on the data structure, create a network object from the dataset loaded#
#If it's an edgelist...#

tst_ntwrk <- 
  graph.data.frame(passIt[,3:2,1],
                   directed = T)
summary(tst_ntwrk)

plot(tst_ntwrk)
plot(tst_ntwrk, vertex.cex = .5)

plot(tst_ntwrk, vertex.cex =2, mode = "circle")
###################################################################
#Step 4: Generating a graph object (igraph) or network object (statnet)

##If data are in edgelist format (A) and are undirected (B), use the following command:#

#igraph object 
network.ig<-
  graph.edgelist(as.matrix(deathCo_recip.df),
                 directed=F) 





##### FUCK IT 
      #####
            #####
            ##### FOR REAL
# Node List: as Matrix

mtrxIt <- 
  as.matrix(
    passIt[c(
      "dnkName", # Node
      "dnkCode") # # Unique ID for each Node
      ]
    )

class(mtrxIt)
summary(mtrxIt)

nodes_mtrx <- 
  mtrxIt
class(nodes_mtrx)
summary(nodes_mtrx)

# Edge Attributes : As Matrix

mtrxIt <- 
  as.matrix(
    passIt[c(
      "ingType", # Edge attributes
      "dnkIng")
    ]
  )

edgeAt_mtrx <- 
  mtrxIt
class(edgeAt_mtrx)
summary(edgeAt_mtrx)


#       Edgelist: Combine Node + Attributes into Network
####
## Use "network()" function to crate network Object

smugCov_ntWrk <- network(
  edgeAt_mtrx, 
  vertex.attr = nodes_mtrx, 
  matrix.type = "edgelist", 
  ignore.eval = FALSE)

colnames(smugCov_ntWrk)
class(smugCov_ntWrk)
summary(smugCov_ntWrk)



### TEST: Basic R Visualizations 
plot(smugCov_ntWrk, vertex.cex = 3)

plot(smugCov_ntWrk, vertex.cex =10, mode = "circle")

# First let's create the object. 
## This method automatically adds edge attributes
alliance_netEdge_ig <- 
  graph_from_data_frame(
    d = alliance_netEdge, 
    directed = FALSE)


## Generate Node List
smugCov_nodes <- matrixIt %>%
  distinct(dnkName) %>%
  rename(label = dnkName)%>%
  distinct(dnkCode) %>%        
  rename(label = dnkCode)%>%

class(smugCov_nodes)
summary(smugCov_nodes)
print(smugCov_nodes)

# Nodelist to Matrix to Vector
mtrxIt  <- as.matrix(indx_SmugglerCove_recip)

class(mtrxIt)
summary(mtrxIt)

vectordata=as.vector(mtrxIt)
print(vectordata)


        # Create Edges 
          ## NOTE: "edges" in smugCovIdx were created, sorted, in "passIt"


