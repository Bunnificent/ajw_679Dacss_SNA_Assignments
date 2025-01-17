###################################################################
############## Basic Network Creation and Selection  ##############
###################################################################

###################################################################
#Step 1: Set Working Directory
#First we need to set the working directory, or file path for data#
##select and modify one of the commands below
###################################################################
setwd("C:/Users/Tim/Google Drive/Political Networks Course/Datasets") ##Windows format
setwd("~/Google Drive/Political Networks Course/Network Datasets") ##Mac format

###################################################################
#Step 2: Read raw data into R
#Different approaches to reading into R, depending on file format
##choose only one of approaches below
###################################################################

#standard csv format, replace "data.csv" with name of file
network_data<-read.csv("data.csv",header = T,stringsAsFactors = F) 
#gsheet format, replace "url" with sharing url of google sheet (share link)
network_data<-gsheet2tbl("https://docs.google.com/spreadsheets/d/11pULe5uPbgEH5qUu6yA8MHlZui4x2_4H_2A94cYckLs/edit?usp=sharing")
#json format, replace "url.json" with json document url
network_data<-fromJSON(txt="http://www.zengxiaohan.com/media/code/data/a-song-of-ice-and-fire-desc.json") 

###################################################################
#Step 3: clean network_data into edgelist or adjacency matrix format
###################################################################

#check for adjacency vs edgelist 
dim(network_data)

#if your data are in the form of adjacency matrix, network_data is square (nxn)
#go straight to Step 4 if network_data is square

#if your data are in the form of an edgelist, network data is nx2 (or more with edge attributes)
#first column of network_data should be "From", second column should be "To"
##inspect column names as 3rd-kth columns of network_data may include network attributes
colnames(network_data)
#go to Step 4

#if your data are an affiliation matrix, there are two types of nodes (e.g., people and parties)
#then network_data should be a matrix of dimension n1xn2
#convert to a single mode network in order to analyze
#choose either dimension n1xn1 or n2xn2 (nodes in rows or nodes in columns)
network_mat<-as.matrix(network_data)%*%t(as.matrix(network_data)) #n1xn1 (rows)
network_mat<-t(as.matrix(network_data))%*%as.matrix(network_data) #n2xn2 (columns)

###################################################################
#Step 4: Generating a graph object (igraph) or network object (statnet)#
#identify data format and then choose one of the following
#choose igraph or statnet format
###################################################################

##If data are in edgelist format (A) and are undirected (B), use the following command:#
network.ig<-graph.edgelist(as.matrix(network_data),directed=F) #igraph object
network.stat<-network(network.data[,1:2], directed=F, matrix.type="edgelist") #statnet object

##If data are in edgelist format (A) and are directed (B), use the following command:#
network.ig<-graph.edgelist(as.matrix(network_data),directed=T) #igraph object
network.stat<-network(network.data[,1:2], directed=T, matrix.type="edgelist") #statnet object

##weighted edgelists will read in automatically if third column is "weights" in igraph
##weighted edgelist values can be read in statnet in Step 5

##If data are in adjacency format (A) and are undirected (B), use the following command:#
network.ig<-graph.adjacency(network_data,mode="undirected") #igraph object
network.stat<-network(network.data, directed=F, matrix.type="adjacency") #statnet object

##If data are in adjacency format (A) and are directed (B), use the following command:#
network.ig<-graph.adjacency(network_data,mode="directed") #igraph object
network.stat<-network(network.data, directed=F, matrix.type="adjacency") #statnet object

##weighted adjacency matrix (entries are not 0/1) will read automatically in igraph
##weighted adjacency matrix can be read in statnet using option ignore.eval and names.eval
network.stat<-network(network.data, directed=F, matrix.type="adjacency", 
                      ignore.eval=FALSE, names.eval="weight") #statnet object

###################################################################
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

##########################################################################
# Step 6: Extracting subnetworks on the basis of node or edge attributes #
##########################################################################
#extract subnetwork with specific nodes or only specific edges

##select on basis of edge attributes
##here, weight greater than value "x"
subnetwork.ig<-subgraph.edges(network.ig,eids=which(E(network.ig)$weight>x)) #igraph
subnetwork.stat<-get.inducedSubgraph(network.stat,
                                     eid=which(network.stat%e%'weight'>x)) #statnet

##select specific nodes
##select alters of a single node
neighbors(network,V(network)[interesting_node]) #igraph

#select all nodes with some attribute "nodeattr' greater than value "x"
subnetwork.ig<-induced_subgraph(network.ig,vids=which(V(network.ig)$nodeattr>x)) #igraph
subnetwork.stat<-get.inducedSubgraph(network.stat,
                                     v=which(network.stat%v%'nodeattr'>x)) #statnet
