############## Basic Network Creation and Selection  ##############

###################################################################
#Step 1: Set Working Directory
getwd()
setwd()

###################################################################
#Step 2: Read raw data into R
#Different approaches to reading into R, depending on file format


## possible adjacency matrix

## possible edgelists


###################################################################
#Step 3: clean network_data into edgelist or adjacency matrix format

#check for adjacency vs edgelist 

dim(deathCo_Recip.df)
dim(leConRecip.df)
dim(smugDrink_Indx.df)



          #if your data are in the form of an edgelist, network data is nx2 (or more with edge attributes)
          #first column of network_data should be "From", second column should be "To"

  ##inspect column names as 3rd-kth columns of network_data may include network attributes
colnames( )
# lol need to find readable human format



###################################################################
#Step 4: Generating a graph object (igraph) or network object (statnet)

        ##If data are in edgelist format (A) and are undirected (B), use the following command:#

#igraph object 
network.ig<-
  graph.edgelist(as.matrix(deathCo_recip.df),
                 directed=F) 
#statnet object 
network.stat<-
  network(network.data[,1:2], 
          directed=F, 
          matrix.type="edgelist") 

        ##If data are in edgelist format (A) and are directed (B), use the following command:#

#igraph object 
network.ig<-
  graph.edgelist(as.matrix(deathCo_recip.df),
                 directed=T) 
              ##weighted edgelists will read in automatically if third column is "weights" in igraph

#statnet object 
network.stat<-
  network(network.data[,1:2], 
          directed=T, 
          matrix.type="edgelist") 
                ##weighted edgelist values can be read in statnet in Step 5

        ##If data are in adjacency format (A) and are undirected (B), use the following command:#

#igraph object 
network.ig<-
  graph.adjacency(network_data,
                  mode="undirected") 

#statnet object 
network.stat<-
  network(network.data, 
          directed=F, 
          matrix.type="adjacency") 


        ##If data are in adjacency format (A) and are directed (B), use the following command:#

#igraph object 
network.ig<-
  graph.adjacency(network_data,
                  mode="directed") 
              ##weighted adjacency matrix (entries are not 0/1) will read automatically in igraph

#statnet object 
network.stat<-
  network(network.data, 
          directed=F, 
          matrix.type="adjacency") 
              ##weighted adjacency matrix can be read in statnet using option ignore.eval and names.eval

#statnet object 
network.stat<-
  network(network.data, 
          directed=F, 
          matrix.type="adjacency",
          ignore.eval=FALSE, 
          names.eval="weight") 

# Step 5: Adding edge and node attributes to network/graph object #
###################################################################
#If you have edgelist data, edge attributes will often be stored in same data file
#iGraph will read in all edge attributes automatically, inspect as follows
edge_attr(network.ig)
##but to create new edge attribute if edges sorted correctly
E(network.ig)$COLNAME<-edge.attribute$COLNAME

#for edgelist data read into statnet, simply add the edge attributes as follows
#repeat as needed, replacing colname with the name of the edge attributes from line 39
network.stat%e%'colname'<- network_data$colname

#node attributes will often be in a separate datafile
#read in the file, replacing "filename" as needed
vertex_attributes<-read.csv("vertex_attribute_file.csv",header=T,stringsAsFactors=F)

#The vertex names in this file must exactly match those in the network#
#sometimes this requires using as.character(x) to change from factor to character
#create vertex attributes in igraph
V(network.ig)[match(V(network)$name,vertex_attributes$VERTEX_NAME)]$COLNAME<-
  vertex_attributes$COLNAME

#vertex attributes in statnet
network.stat%v%'COLNAME'<- vertex_attributes$COLNAME



# Step 6: Extracting subnetworks on the basis of node or edge attributes #
##########################################################################

        #extract subnetwork with specific nodes or only specific edges

        ##select on basis of edge attributes
            ##here, weight greater than value "x"

#igraph 
subnetwork.ig<-
  subgraph.edges(network.ig,
                 eids=which(E(network.ig)$weight>x)
                 )

#statnet
subnetwork.stat<-
  get.inducedSubgraph(network.stat,
                      eid=which(network.stat%e%'weight'>x)
                      ) 

        ##select specific nodes
        ##select alters of a single node

#igraph 
neighbors(network,
          V(network)[interesting_node]
          )

#select all nodes with some attribute "nodeattr' greater than value "x"
#igraph 
subnetwork.ig<-
  induced_subgraph(network.ig,
                   vids=which(V(network.ig)$nodeattr>x)
                   ) 

#statnet 
subnetwork.stat<-
  get.inducedSubgraph(network.stat,
                      v=which(network.stat%v%'nodeattr'>x)
                      ) 