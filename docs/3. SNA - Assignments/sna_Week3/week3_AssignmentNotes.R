# [697: Week 3 Assignment: Degree and Centrality](https://docs.google.com/document/d/1vE7ICJVbqq6PrLQqg-ix77Y3kC1jz0UuziJOw0v0et0/edit)
######
### Using the tutorial as a guide, 
*  you may use your own data; 
*  the data provided in the week 3. Syntax dataset is Correlates of War trade network - you can read more about it online; or
*  choose another dataset.

## Working from the example R syntax:
1.   calculate network density; 
2.   degree centrality, and 
3.   centralization measures for your network data. 


## Write up your results briefly:
*   focus on interpretation of the results. 
*   Don’t list statistics or provide code, 
*  **the goal is to choose a few interesting results and provide an interpretation.**
  
  ## Briefly describe the dataset:
  1.   identify initial network format; 
2.   describe and identify the nodes 
including: 
  *  how many nodes are in the dataset; 
3.   what constitutes a tie or edge
including:
  *  how many ties, 
*   whether ties are directed/undirected,
*   whether ties are weighted/binary, 
*   and how to interpret the value of the tie if any.
*   Whether or not there are edge attributes 
that might be used to:
  *   subset data, or 
*   stack multiple networks. 
Not every feature of the network needs to be described, but **description should orient reader to the network data and provide any necessary context for the results provided.**
  
  ## Provide at least two or three noteworthy results, including:
  1.   the relevant statistics and interpretation. 
For example, explaining which node(s) are most central and which are least central. 
2.   Discuss (with any related evidence) whether or not the node(s) behavior is in line with or violates expectations based on the degree centrality measure. 
3.   What do you make of network density and centralization measures?  
  4.   What about differences in the binary 100 million threshold network vs valued trade flows network. 
5.  Check tutorial for other ideas of results to discuss.

  ######
#####
      ##### Tutorial: Network Degree, Week 3
#####
      ### Statnet Getting Started
#####
library(statnet)

data-EXAMPLE <- read.csv("EXAMPLE.csv", header=T, row.names=1, check.names=FALSE)
#include header = T and row.names = 1 to account for the node labels

att-EXAMPLE = read.csv("EXAMPLE_Attributes.csv", header=T)

data-EXAMPLE
head(att-EXAMPLE)


# Data Management
smug_matrix = as.matrix(smugCovIdx) # tell R data should be understood as a matrix
smug_matrix =network(matrix-EXAMPLE, matrix.type="edgelist",directed=FALSE) # transforms into a network object
msmug_matrix

head.matrix(smug_matrix)


Next, you need to link the attribute data with the network object. To do this it’s necessary that the nodes in the network object and attribute data be in the same order. Then, there are two ways to link the data.

#check if nodes are in the same order
(att-EXAMPLE$ID==rownames(as.sociomatrix(network-EXAMPLE))
  
  
  # First, you can go in and add the attributes in one at a time.
  #option 1
  network-EXAMPLE %v% "dept" <- (att-EXAMPLE$DEPT
                                 network-EXAMPLE
                                 
# Alternatively, you can add the attributes in when you make the network option
#option 2
  network-EXAMPLE = network(matrix-EXAMPLE, matrix.type = "adjacency", directed = T, vertex.attr = (att-EXAMPLE)

network-EXAMPLE
                                           
                                           
                                           # add in new edges to the network object or 
                                           network-EXAMPLE[2,1] <- 1 #adds an EXAMPLE tie from node 2 to node 1
                                           
                                           # delete existing edges.
                                           network-EXAMPLE[2,1] <- 0 #removes an EXAMPLE tie from node 2 to node 1
                                           
                                           # You can also check whether edges exist between pairs.
                                           network-EXAMPLE[1,2] #does node 1 send an EXAMPLE tie to node 2?
                                           
                                           ### Statnet Descriptives
                                           a bunch of functions that calculate network-level descriptives:
                                             
                                             summary(network-EXAMPLE) 
                                           #summary of network object, also provides an edge list
                                           
                                           network.size(network-EXAMPLE) 
                                           #number of nodes in the network
                                           
                                           network.dyadcount(network-EXAMPLE) 
                                           #number dyads that exist in network (n*(n-1))
                                           
                                           network.edgecount(network-EXAMPLE) 
                                           #number of edges present in the network
                                           
                                           gden(network-EXAMPLE) 
                                           #network density (edge count/dyad count)
                                           
                                           grecip(network-EXAMPLE, measure = "dyadic") 
                                           #proportion of symmetric dyads
                                           
                                           gtrans(network-EXAMPLE, measure = "weak") 
                                           #proportion of transitive triads
                                           
                                           symmetrize(network-EXAMPLE, rule = "weak") 
                                           #symmetrize so i<->j iff i->j OR i<-j 
                                           
                                           symmetrize(network-EXAMPLE, rule = "strong") 
                                           #symmetrize so i<->j iff i->j OR i<-j 
                                           
                                           dyad.census(network-EXAMPLE) 
                                           #MAN dyad census
                                           
                                           triad.census(network-EXAMPLE) 
                                           #standard directed triad census
                                           
                                           kpath.census(network-EXAMPLE, maxlen=3, tabulate.by.vertex=FALSE) 
                                           # Count paths of length <=3
                                           
                                           kcycle.census(network-EXAMPLE, maxlen=3, tabulate.by.vertex=FALSE) 
                                           # Count cycles of length <=3
                                           
                                           clique.census(network-EXAMPLE, tabulate.by.vertex=FALSE, enumerate=FALSE) 
                                           # counts of cliques by size
                                           
                                           ### Statnet: ode-level descriptive statistics
                                           
                                           degree(network-EXAMPLE, cmode="indegree") 
                                           #indegree, number of nominations received
                                           
                                           degree(network-EXAMPLE, cmode="outdegree") 
                                           #outdegree, number of nominations sent
                                           
                                           degree(network-EXAMPLE) 
                                           #total degree (sent+received)
                                           
                                           betweenness(network-EXAMPLE) 
                                           #betweenness
                                           
                                           closeness(network-EXAMPLE) 
                                           #closeness
                                           
                                           isolates(network-EXAMPLE) 
                                           #lists the isolates in the graph
                                           
                                           geodist(network-EXAMPLE) 
                                           #gives number and lengths of all geodesics (shortest paths) between all nodes 
#####
#####                                           
      ### Load Data -> Network Object (easy way)
                                           
                                           # Import Network Data
                                           
                                           print()
                                           # Convert to Statnet Object
                                           
                                           
                                           # Convert to iGraph Object
                                           
                                           print_all(EXAMPLE.ig)
                                           
                                           ### The Hard Ways
                                           
                                           # Remove everything in our workspace so we can start with a clean slate:
                                           rm(list = ls())
                                           # Set our working directory (for me this is just my desktop)
                                           setwd("~/Desktop")
                                           
                                           # Getting Data 
                                           data-EXAMPLEa <- read.csv("D:/RStudio/SocialNetworkAnalysis/socialnetworkdata.csv", header=T)
                                           
                                           # Create network
                                           net <- graph.data.frame(y, directed=T)
                                           Vnetwork-EXAMPLEet+ 52/52 vertices, named, from 4c03f50: 
                                             Enetwork-EXAMPLEet 290/290 edges from 4c03f50 (vertex names):
                                             
                                             # We got 52 vertices and 290 edges. Let’s assign the labels.
                                             Vnetwork-EXAMPLEet$label <- Vnetwork-EXAMPLEet$name
                                           Vnetwork-EXAMPLEet$degree <- degreenetwork-EXAMPLEet
                                           
                                           # Statnet Load Data
                                           data-EXAMPLEa <- read.csv("EXAMPLE.csv", header=T, row.names=1, check.names=FALSE)
                                           #include header = T and row.names = 1 to account for the node labels
                                           
                                           att-EXAMPLE = read.csv("EXAMPLE_Attributes.csv", header=T)
                                           
                                           att-EXAMPLE
                                           head(att-EXAMPLE)
                                           
                                           
                                           
                                           
                                           
                                           # Creating A Network Object
                                           
                                           # using the as.network() function 
                                           network-EXAMPLEet <- as.network(x = my_sociomatrix, # the network object
                                                                           directed = TRUE, # specify whether the network is directed
                                                                           loops = FALSE, # do we allow self ties (should not allow them)
                                                                           matrix.type = "adjacency" # the type of input
                                           )
                                           
                                           
                                           summary.network(network-EXAMPLEet,print.adj = FALSE)
                                           
  #####
  #####
       #### Basic Network Description
          # Describe the Network: Find network size, type (un/directed, un/weighted, bipartite) and available attributes of vertices and edges
                                           
                                           dim()
                                           
                                           print()
                                           
                                           
                                           # Dyad Census:
                                           
                                           #Classify all dyads in the network: igraph
                                           igraph::dyad.census(EXAMPLE.ig)
                                           
                                           #Classify all dyads in the network: statnet
                                           sna::dyad.census(EXAMPLE.stat)
                                           
                                           **Triad Census:**
                                             Are there any interesting patterns for triads in the network?
                                             
                                             # Triad Census: Are there any interesting patterns for triads in the network?
                                             
                                             # Classify all triads in the network: igraph
                                             igraph::triad.census(EXAMPLE.ig)
                                           
                                           #Classify all triads in the network: statnet
                                           sna::triad.census(EXAMPLE.stat)
                                           
                                           # Clustering and Transitivity
                                           
                                           # igraph
                                           #get global clustering cofficient
                                           transitivity(EXAMPLE.ig,
                                                        type = c("undirected", "global", "globalundirected", "localundirected", "local",
                                                                 "average", "localaverage", "localaverageundirected", "barrat", "weighted"),
                                                        vids = NULL,
                                                        weights = NULL,
                                                        isolates = c("NaN", "zero")
                                           )
                                           
                                           
                                           # statnet:
                                           # get network transitivity
                                           gtrans(EXAMPLE.stat)
                                           
                                           **Component Structure and Isolates:**
                                             Inspect the component structure of the network. Are there any isolates?**
                                             
                                             # Component Structure: 
                                             
                                             igraph::components(EXAMPLE.ig)$no 
                                           #Number of components
                                           
                                           igraph::components(EXAMPLE.ig)$csize 
                                           #Size of each component
                                           
                                           
                                           
                                           # Isolates:
                                           
                                           #List the isolates
                                           isolates(EXAMPLE.ig)
                                           
                                           # Returns a list of the isolates in the graph or graph set
                                           isolates(data-EXAMPLE, diag=FALSE)
                                           
                                           # Is Ego an Isolate?
                                           is.isolate(data-EXAMPLE, ego, g=1, diag=FALSE)
                                           
                                           # Adds n isolates to the graph (or graphs)
                                           add.isolates(data-EXAMPLE, n, return.as.edgelist = FALSE)
                                           
                                           
                                           
      #####
#####                                           
      ### Network Density
                                           
                                           The density of a network is defined as the proportion of ties present out of all possible ties in a network. 
                                           
                                           
                                           
                                           **Note:**
                                             
                                             the network density command ignores edge values at present. 
                                           
                                           If loops are present or there are multiple edges between two nodes, then the results may not make sense.
                                           
                                           **Igraph** provides an incorrect density calculation as the default assumes  that loops are not included but does not remove them. 
                                           
                                           Therefore, the default calculation includes the loops in the numerator but not the denominator of the density calculation.
                                           
                                           # igraph: Network Density 
                                           
                                           #get network density without loops: igraph
                                           network.density(
                                             (EXAMPLE.ig, 
                                              loops=TRUE
                                             )
                                             
                                             # get network density
                                             network.density(EXAMPLE.ig)
                                             # provides an incorrect density calculation as the default assumes that loops are not included but does not remove them
                                             
                                             
                                             
                                             # statnet: Network Density 
                                             
                                             # get network density: with possible loops
                                             network.density(EXAMPLE.stat)
                                             
                                             # get network density without loops: statnet
                                             gden(EXAMPLE.stat, diag=FALSE)
                                             
                                             
                                             ## Vertex Degree
                                             **Vertex degree** is a description of an individual node; each vertex in a network may have a different node degree.
                                             
                                             
                                             *Node Degree:*
                                               node degree is one measure of node centrality or popularity; 
                                             Node degree cis a count of the relationships that a node is involved in or the count of the edges that are incident to a vertex
                                             
                                             
                                             
                                             **use the network degree command to:**
                                               *  compute network summary statistics (such as average network degree);
                                             *  graph the network degree distribution; or
                                             *  identify particular nodes (such as the five nodes with the most contacts).
                                             
                                             
                                             # statnet: Calculate average network degree
                                             sna::degree(EXAMPLE.stat)
                                             # ignores loops or self-nominations
                                             
                                             
                                             # igraph: Calculate average network degree
                                             # provides node name along with node degree
                                             
                                             igraph::degree(EXAMPLE.ig,
                                                            loops=False)
                                             
                                             # includes loops
                                             igraph::degree(EXAMPLE.ig)
                                             
                                             
                                             
                                             ## Tutorial: Data Manipulation in R
                                             
                                             
                                             
                                             install.packages("tidyverse")
                                             
                                             library(tidyverse)
                                             
                                             ### Create a DataFrame
                                             It is often useful to create a dataframe object that contains a set of vector objects (variables) stored in the columns (with cases in the rows.) 
                                             
                                             #create the dataframe
                                             df-EXAMPLE <-data.frame(
                                               col_A_variable_name=c("row 1", "row 2", "row 3"), 
                                               col_B_variable_name=c("case 1","case 2","case 3"),
                                               col_C_variable_name=c(1, 2, 3)
                                             )
                                             #return the dataframe
                                             df-EXAMPLE 
                                             
                                             # list of columns names
                                             colnames(df-EXAMPLE)
                                             
                                             # all the values of a particular case 
                                             filter(df-EXAMPLE,
                                                    logical-condition
                                             )
                                             
                                             # Logical operators: >, <, >=, <=, %in%, == , !=
                                             
                                             # Add variable to the dataframe
                                             df-EXAMPLE <-mutate(df-EXAMPLE, 
                                                                 final=c(94,88,90)
                                             )
                                             #return the dataframe
                                             df-EXAMPLE 
                                             
                                             
                                             # mutate(): Add variable
                                             mutate(df-EXAMPLE, 
                                                    grade=(rank+2*final)/3
                                             )
                                             
                                             ### Subsetting a dataframe
                                             we can access individual columns of cases using the select command or the $ operator
                                             
                                             # list of columns names
                                             colnames(df-EXAMPLE)
                                             
                                             # access individual columns of cases
                                             select(df-EXAMPLE,col_variable-name)
                                             
                                             # access individual columns of case
                                             df-EXAMPLE$col_variable_name
                                             
                                             ### Ordering and Arranging Data: 
                                             
                                             Basic commands
                                             
                                             # adds new variables that are functions of existing variables
                                             mutate() 
                                             
                                             
                                             # picks variables based on their names.
                                             select(variable, ends_with("CHAR")) 
                                             
                                             
                                             # picks cases based on their values.
                                             filter(variable == "case 1") 
                                             
                                             
                                             # reduces multiple values down to a single summary.
                                             summarise() 
                                             
                                             
                                             # changes the ordering of the rows.
                                             arrange(.data, colomn-name1, colomn-name2)
                                             arrange(.data, .by_group = FALSE)
                                             arrange(.data, .by_group = TRUE) # will sort first by grouping variable 
                                             arrange(.data, desc,(variable-NUM))
                                             
                                             
                                             
                                             ** sorting**
                                               
                                               library(tidyverse)
                                             
                                             #sort a vector
                                             df<-data.frame(
                                               time=c(55,23,48,3,112,14,25), 
                                               type=c("A", "B", "A", "B","B","A", "B"))
                                             arrange(df,time)
                                             
                                             #sort largest numbers first
                                             arrange(df, desc(time))
                                             
                                             #only return 3 largest values
                                             arrange(df, desc(time))%>%
                                               slice(1:3)
                                             
                                             **group_by()** takes an existing tbl and converts it into a grouped tbl where [operations are performed "by group"](https://dplyr.tidyverse.org/reference/group_by.html). 
                                             
                                             **ungroup()** removes grouping.
                                             
                                             # Group by one or more variables
                                             
                                             group_by(
                                               .data, # data frame, a tibble, ect
                                               ..., # variables or computations to group by
                                               .add = FALSE, # override existing groups
                                               = TRUE, # add to the existing groups
                                               .drop = group_by_drop_default(.data)
                                             )
                                             
                                             ungroup(x, 
                                                     ... # variables to remove from the grouping.
                                             )
                                             
                                             
                                             
                                             Group_by and Summarise
                                             
                                             *  **summarise** is in aggregation command that removes all variables and case not specified explicitly.
                                             
                                             library(dplyr)
                                             
                                             #calculate averages by column/variable-name
                                             df-EXAMPLE%>%
                                               group_by(col_variable-name)%>%
                                               summarise(average=mean(
                                                 ( + )/2))
                                             
                                             
                                             
                                             
                                             #### Grouping metadata
                                             
                                             
                                             *  **group_data()** returns a data frame that defines the grouping structure. The columns give the values of the grouping variables. The last column, always called .rows, is a list of integer vectors that gives the location of the rows in each group. You can retrieve just the grouping data with group_keys(), and just the locations with group_rows().
                                             
                                             * **group_indices()** returns an integer vector the same length as .data that gives the group that each row belongs to (cf. group_rows() which returns the rows which each group contains). group_indices() with no argument is deprecated, superseded by cur_group_id().
                                             
                                             *  **group_vars()** gives names of grouping variables as character vector; groups() gives the names as a list of symbols.
                                             
                                             * **group_size()** gives the size of each group, and n_groups() gives the total number of groups
                                             
                                             # .data, .tbl, x : A data frame or extension (like a tibble or grouped tibble
                                             
                                             group_data(.data)
                                             group_rows(.data)
                                             group_vars(x)
                                             groups(x)
                                             group_size(x)
                                             n_groups(x)
                                             
                                             # Use of ... is now deprecated; please use group_by() first instea
                                             group_by()%>%
                                               group_keys(.tbl, ...)
                                             
                                             groupby()%>%
                                               group_indices(.data, ...))
                                           
                                           ### Plotting Distributions
                                           
                                           # basic R: command that draws a histogram of  a single variable 
                                           
                                           hist(df-EXAMPLE,
                                                main="", #for the main title of the histogram,
                                                xlab="" #for the label of the x-axis
                                           )
                                           
                                           library(ggplot2)
                                           
                                           
                                           #plot a histogram: geom_histogram()
                                           ggplot(df-EXAMPLE, aes(variable-name)) +
                                             geom_histogram() +
                                             labs(
                                               title = "main-title",
                                               x="x-axis-label")
                                           
                                           
                                           #plot a histogram: geom_bar()
                                           ggplot(df-EXAMPLE, aes(variable-name)) +
                                             geom_bar() +
                                             labs(
                                               title = "main-title",
                                               x="x-axis-label")
                                           
                                           
                                           
                                           ## SNA: Create a DataFrame
                                           
                                           *   It will be useful to store vertex attributes such as degree in a table of node attributes.
                                           *  This table, or data frame, of node measures can even be used in traditional econometric models that include network structure variables. 
                                           
                                           # igraph (basic R)
                                           # create a dataset of vertex names and degree
                                           data.frame(
                                             name=V(EXAMPLE.ig)$name, 
                                             degree=igraph::degree(EXAMPLE.ig)
                                             
                                             
                                             # statnet (basic R)
                                             # create a dataset of vertex names and degree: 
                                             nodes-EXAMPLE<-
                                               data.frame(
                                                 name=EXAMPLE.stat%v%"vertex.names", 
                                                 degree=sna::degree(EXAMPLE.stat)
                                               )
                                             
                                             nodes-EXAMPLE
                                             
                                             head(nodes-EXAMPLE) 
                                             
                                             ## Degree in Directed Networks
                                             
                                             In a **directed network**, it is possible to calculate both 
                                             * ** indegree **or the total number of nodes that send a tie to the focal node, 
                                             *  and **outdegree**, or the total number of nodes to which the focal node sends a tie.
                                             ---
                                               
                                               R allows you to specify whether you want to calculate
                                             * in-degree, 
                                             *  out-degree, or 
                                             *  total degree 
                                             when working with a directed network. 
                                             
                                             ***function default:*** produces a count of total degree.
                                             
                                             
                                             
                                             ### Calculate Degree in Directed Networks
                                             
                                             
                                             #statnet: calculate degree
                                             
                                             nodes-EXAMPLE<-
                                               data.frame(name=EXAMPLE.stat%v%"vertex.names",
                                                          totdegree=sna::degree(EXAMPLE.stat),
                                                          indegree=sna::degree(EXAMPLE.stat, cmode="indegree"),
                                                          outdegree=sna::degree(EXAMPLE.stat, cmode="outdegree")
                                               )
                                             
                                             # Basic R: get summary statistics for node attributes
                                             summary(nodes-EXAMPLE)
                                             # provides range, mean, median and standard deviation of a vector.
                                             
                                             #igraph: calculate degree
                                             
                                             nodes-EXAMPLE<-
                                               data.frame(name=V(EXAMPLE.ig)$name,
                                                          totdegree=igraph::degree(EXAMPLE.ig, loops=FALSE),
                                                          indegree=igraph::degree(EXAMPLE.ig, mode="in", loops=FALSE),
                                                          outdegree=igraph::degree(EXAMPLE.ig, mode="out", loops=FALSE)
                                               )
                                             
                                             # Basic R: get summary statistics for node attributes
                                             summary(nodes-EXAMPLE)
                                             # provides range, mean, median and standard deviation of a vector.
                                             
                                             ### Network Degree Summary Statistics
                                             
                                             *  use the **basic summary command** to find the range, mean, median and standard deviation of a vector.
                                             
                                             # Basic R: get summary statistics for node attributes
                                             summary(nodes-EXAMPLE)
                                             # provides range, mean, median and standard deviation of a vector.
                                             
                                             *  use **summary statistics** for node degree for the binary network degree, creating the appropriate dataframe in this exercise and getting the summary.
                                             
                                             # ADVANCED EXERCIZE
                                             # Basic R: 
                                             # get summary statistics for node degree for the binary network degree
                                             
                                             summary(data.frame(
                                               name=EXAMPLE.stat%v%"vertex.names",
                                               totdegree=sna::degree(EXAMPLE.stat),
                                               indegree=sna::degree(EXAMPLE.stat, cmode="indegree"),
                                               outdegree=sna::degree(EXAMPLE.stat, cmode="outdegree")
                                             ))
                                             
                                             ** Summarise by Group** There are often times when we may want to know about groups of nodes, not everyone in the network.
                                             
                                             
                                             *For example*, maybe we care about average network characteristics of nodes grouped by family or age.
                                             
                                             # ADVANCED EXERCIZE
                                             # Basic R:
                                             # Summarise by Group
                                             
                                             df%>%
                                               group_by(type)%>%
                                               summarise_all(
                                                 funs(mean,
                                                      n()
                                                 )
                                               )
                                             
                                             
                                             # Visualizations
                                             
                                             
                                             ## igraph provides three different ways for visualization.
                                             
                                             # igraph Visualizations
                                             
                                             plot.igraph()
                                             # uses regular R graphics and can be used with any R device.
                                             
                                             
                                             tkplot and its companion functions serve as an interactive graph drawing facility. Not all parameters of the plot can be changed interactively right now though, eg. the colors of vertices, edges, and also others have to be pre-defined.[link text](https://igraph.org/r/html/latest/tkplot.html)
                                             
                                             [igraph list of parameters](https://igraph.org/r/html/latest/plot.common.html)
                                             
                                             # igraph Visualizations
                                             #  (Tk is quite resource hungry, so don't try this for very large graphs.)
                                             
                                             tkplot(EXAMPLE.ig, 
                                                    canvas.width = 450, 
                                                    canvas.height = 450, 
                                                    ..., # ... Additional plot parameters
                                             )
                                             
                                             tk_close(EXAMPLE.id, window.close = TRUE)
                                             
                                             tk_off()
                                             
                                             tk_fit(EXAMPLE.id, width = NULL, height = NULL)
                                             
                                             tk_center(EXAMPLE.id)
                                             
                                             tk_reshape(EXAMPLE.id, newlayout, ..., params)
                                             
                                             tk_postscript(EXAMPLE.id)
                                             
                                             tk_coords(EXAMPLE.id, norm = FALSE)
                                             
                                             tk_set_coords(EXAMPLE.id, coords)
                                             
                                             tk_rotate(EXAMPLE.id, degree = NULL, rad = NULL)
                                             
                                             tk_canvas(EXAMPLE.id)
                                             
                                             [link text](https://)## Statnet: Visualization
                                             
                                             The statnet package also allows for you to easily visualize your network graphs with the gplot function.
                                             
                                             
                                             # visualize your network graphs 
                                             gplot(network-EXAMPLE)
                                             
                                             # add in vertex labels and change the size and color of these labels
                                             gplot(network-EXAMPLE, 
                                                   displaylabels=TRUE,
                                                   label.cex=.75, 
                                                   label.col="black"
                                             )
                                             
                                             # For directed graphs, you can turn off the arrows
                                             gplot(network-EXAMPLE, 
                                                   displaylabels=TRUE, 
                                                   label.cex=.75, 
                                                   label.col="black", 
                                                   usearrows = FALSE
                                             )
                                             
                                             # differentiate nodes based on their attributes
                                             gplot(network-EXAMPLE, 
                                                   displaylabels=TRUE,
                                                   label.cex=.75,
                                                   label.col="black",
                                                   vertex.col=att$DEPT
                                             )
                                             
                                             legend("bottomleft",
                                                    fill=0:4,
                                                    legend=paste("DEPT",0:4),
                                                    cex=0.75
                                             )
                                             
                                             # changed the shape of the nodes based on the level of their positions. 
                                             ## You change the shape of the nodes by specifying the number of sides you want the shape to have using the vertex.sides argument. 
                                             gplot(network-EXAMPLE, 
                                                   displaylabels=TRUE,
                                                   label.cex=.75,
                                                   label.col="black",
                                                   vertex.cex = 2,
                                                   vertex.sides=(att$LEVEL+2)
                                             )
                                             
                                             Arguments
                                             
                                             
                                             **graph	**
                                               The graph to analyze.
                                             
                                             **type**	
                                               The type of the transitivity to calculate. Possible values:
                                               
                                               **"global"**
                                               The global transitivity of an undirected graph (directed graphs are considered as undirected ones as well). This is simply the ratio of the triangles and the connected triples in the graph. For directed graphs the direction of the edges is ignored.
                                             
                                             **"local"**
                                               The local transitivity of an undirected graph, this is calculated for each vertex given in the vids argument. The local transitivity of a vertex is the ratio of the triangles connected to the vertex and the triples centered on the vertex. For directed graph the direction of the edges is ignored. Note that calculations do not work reliably in non-simple graphs, and since the presence of mutual edges in a directed graph becomes non-simple when treated as undirected, therefore it is advised to avoid using this function on non-simple and/or directed graphs. igraph prints a warning in these cases; the warning will be turned into an error in igraph 1.3.0.
                                             
                                             **"undirected"**
                                               This is the same as global.
                                             
                                             **"globalundirected"**
                                               This is the same as global.
                                             
                                             **"localundirected"**
                                               This is the same as local.
                                             
                                             **"barrat"**
                                               The weighted transitivity as defined A. Barrat. See details below.
                                             
                                             **"weighted"**
                                               The same as barrat.
                                             
                                             **vids**	
                                               The vertex ids for the local transitivity will be calculated. This will be ignored for global transitivity types. The default value is NULL, in this case all vertices are considered. It is slightly faster to supply NULL here than V(graph).
                                             
                                             **weights	**
                                               Optional weights for weighted transitivity. It is ignored for other transitivity measures. If it is NULL (the default) and the graph has a weight edge attribute, then it is used automatically.
                                             
                                             **isolates**	
                                               Character scalar, defines how to treat vertices with degree zero and one. If it is ‘NaN’ then they local transitivity is reported as NaN and they are not included in the averaging, for the transitivity types that calculate an average. If there are no vertices with degree two or higher, then the averaging will still result NaN. If it is ‘zero’, then we report 0 transitivity for them, and they are included in the averaging, if an average is calculated.
                                             
                                             ## [network visualization with ggplot2](https://briatte.github.io/ggnet/)
                                             
                                             # Dependencies
                                             library(network)
                                             library(sna)
                                             library(ggplot2)
                                             
                                             # ggnetwork - This package allows to pass network objects to ggplot2 and provides geometries to plot their elements.
                                             install.packages("ggnetwork")
                                             library(ggnetwork)
                                             
                                             # Installation ggplot2
                                             install.packages("GGally")
                                             library(GGally)
                                             
                                             ##  [Static and dynamic network visualization with R](https://kateto.net/network-visualization)
                                             
                                             install.packages("igraph") 
                                             install.packages("network") 
                                             install.packages("sna")
                                             install.packages("ggraph")
                                             install.packages("visNetwork")
                                             install.packages("threejs")
                                             install.packages("networkD3")
                                             install.packages("ndtv")
                                             
                                             ## Statnet: Visualization
                                             
                                             The statnet package also allows for you to easily visualize your network graphs with the gplot function.
                                             
                                             ```{r}
                                             
                                             # visualize your network graphs 
                                             gplot(network-EXAMPLE)
                                             
                                             # add in vertex labels and change the size and color of these labels
                                             gplot(network-EXAMPLE, 
                                                   displaylabels=TRUE,
                                                   label.cex=.75, 
                                                   label.col="black"
                                             )
                                             
                                             # For directed graphs, you can turn off the arrows
                                             gplot(network-EXAMPLE, 
                                                   displaylabels=TRUE, 
                                                   label.cex=.75, 
                                                   label.col="black", 
                                                   usearrows = FALSE
                                             )
                                             
                                             # differentiate nodes based on their attributes
                                             gplot(network-EXAMPLE, 
                                                   displaylabels=TRUE,
                                                   label.cex=.75,
                                                   label.col="black",
                                                   vertex.col=att$DEPT
                                             )
                                             
                                             legend("bottomleft",
                                                    fill=0:4,
                                                    legend=paste("DEPT",0:4),
                                                    cex=0.75
                                             )
                                             
                                             # changed the shape of the nodes based on the level of their positions. 
                                             ## You change the shape of the nodes by specifying the number of sides you want the shape to have using the vertex.sides argument. 
                                             gplot(network-EXAMPLE, 
                                                   displaylabels=TRUE,
                                                   label.cex=.75,
                                                   label.col="black",
                                                   vertex.cex = 2,
                                                   vertex.sides=(att$LEVEL+2)
                                             )
                                             
                                             ```
                                             
                                             
                                             
                                             graph provides three different ways for visualization
                                             ```{r}
                                             # igraph Visualizations
                                             
                                             plot.igraph()
                                             # uses regular R graphics and can be used with any R device.
                                             
                                             
                                             ```
                                             
                                             
                                             ```{r}
                                             # igraph Visualizations
                                             #  (Tk is quite resource hungry, so don't try this for very large graphs.)
                                             
                                             tkplot(EXAMPLE.ig, 
                                                    canvas.width = 450, 
                                                    canvas.height = 450, 
                                                    ..., # ... Additional plot parameters
                                             )
                                             
                                             tk_close(EXAMPLE.id, window.close = TRUE)
                                             
                                             tk_off()
                                             
                                             tk_fit(EXAMPLE.id, width = NULL, height = NULL)
                                             
                                             tk_center(EXAMPLE.id)
                                             
                                             tk_reshape(EXAMPLE.id, newlayout, ..., params)
                                             
                                             tk_postscript(EXAMPLE.id)
                                             
                                             tk_coords(EXAMPLE.id, norm = FALSE)
                                             
                                             tk_set_coords(EXAMPLE.id, coords)
                                             
                                             tk_rotate(EXAMPLE.id, degree = NULL, rad = NULL)
                                             
                                             tk_canvas(EXAMPLE.id)