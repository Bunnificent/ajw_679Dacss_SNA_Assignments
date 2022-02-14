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
  ####
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
  #####
              
#             IGRAPH:  Network Formation  
        ##### IGRAPH: edgelist 
#####
tst_ntwrk <- 
  graph.data.frame(passIt[,3:2,1],
                   directed = T)
summary(tst_ntwrk)

plot(tst_ntwrk)
plot(tst_ntwrk, vertex.cex = .5)
plot(dr_smugCov, vertex.cex =2, mode = "circle")
plot(unDr_smugCov, vertex.cex =2, mode = "circle")
  #####

#             Statnet:  Network Formation  
        ##### Statnet: edgelist 
#####
            #**statnet** object from our edgelist
# Will not have vertex
# Will not have edge attributes

          # First we make the network object. 
#####  
colnames(passIt)
# [1] "dnkName" "dnkIng"  "ingType"


sourceEL_stat <- 
  network(as.matrix
          (passIt[1:3], 
            matrix.type = 'edgelist')
  )
 
      #####
            #**statnet** add edge atributes <aka colnames>
#####  
sourceEL_stat%e% "dnkName"<-
  passIt$dnkName

sourceEL_stat%e%"dnkIng" <- 
  passIt$dnkIng

sourceEL_stat%e%"ingType" <- 
  passIt$ingType

      #####
            #**statnet**Generating the EdgeList

##**round 1**
            # from "_netEdge" select "colNames" to be identified with "vertex.names"
            # future attr: (v/c),(v/n), (e/c), 
            ## ColNames: 
              # "dnkName" "dnkIng"  "ingType"

temp<-
  passIt[, c("dnkName")]
print(temp)
summary(temp)


##**round 2**
              # code still selecting from "_netEdge", add "colNames"
              # future attr: (e/c),(e/n)
colnames(temp)<- 
  c("dnkIng")

print(temp)
summary(temp)


##**round 3**
              # "rBind" selects "colnames" from "_netEdge" and BINDS them to temp
              # future attr: (e/c), (e/n)
temp<-
  rbind(temp,
        passit[, c("dnkIng",
                   "ingType")])

print(temp)
summary(temp)

##**Temp Final Round** !!! is being used as variable in generating an edgelist object
    # temp contains 
    # "Total n-rows", and
    # all future attr: names and classes 
    # (v/c), ccode (v/n), state_name1 (e/c), ccode2 (e/n), state_name2 (e/c)


            #**statnet** Generate Edgelist: w/ attributes 
            # << %v% attribute-name <- value >> extracts "ccode" frompassit_ns and assigns new value

sourceEL_stat%v%"dnkIng"<-
  temp$dnkIng[
    match(
      sourceEL_stat%v%"vertex.names",temp$state_name2)]
    
summary(sourceEL_stat)
# it's a bloody statnet edgelist !!!

#####     
###################################################################

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


