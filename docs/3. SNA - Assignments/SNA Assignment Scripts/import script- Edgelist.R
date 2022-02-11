#This script imports 

#Let's load the libraries you need (install them first if you need to)
if("statnet" %in% rownames(installed.packages()) == FALSE) {install.packages("statnet")}
if("igraph"  %in% rownames(installed.packages()) == FALSE) {install.packages("igraph")}

library(statnet)
library(igraph)

# The import script has created three objects that represent the network:
#   - sourceEL.net (a dataframe of an edgelist and edge attributes)
#   - sourceEL.net_ig (an igraph object)
#   - sourceEL.stat  (a network object compatable with statnet packages like sna & ergm)


#######
      #Lets read the data into the enviroment.

source.df <-cow_alliance


      # Basic Info on Object}
#### list the structure of smugCovIdx

#### class of an object
class()

#### list the variables in smugCovIdx
names()

#### dimensions of an object
dim()


colnames(smugCovIdx)

summary(smugCovIdx)

# ```
#####
    #Format DF to become an edgelist
    
    # Assign modefied source.df to Edge List variable name 
sourceEL.net <- 
  source.df[c( #select column numbers from source.Data in order to be added
    3,#col-num
    5,#col-num
    2,#col-num
    6:10#col-num:col-num
    )
  ]

#####
###   NOTE: if necessary format Data Types and tidy up source.df


#####
    #**igraph** version of the network
          # NOTE: igraph automatically adds edge attributes, but not vertices 
    
    #First let's create the object. 
sourceEL.ig <- 
  graph_from_data_frame(d = sourceEL.net, 
                        directed = FALSE
                        )

#####
    #**statnet** object from our edgelist
          # Will not have vertex
          # Will not have edge attributes

    #First we make the eobject. 
sourceEL.stat <- 
  network(as.matrix
          (sourceEL.net[1:2], 
            matrix.type = 'edgelist')
          )
#####     
      #**statnet** add edge atributes <aka colnames>
sourceEL.stat%e%"source_ColName" <- 
  sourceEL.net$source_ColName

sourceEL.stat%e%"source_ColName" <- 
  sourceEL.net$source_ColName

sourceEL.stat%e%"source_ColName" <- 
  sourceEL.net$source_ColName

sourceEL.stat%e%"source_Col-isNum" <- 
  as.character(sourceEL.net$source_Col-isNum)

sourceEL.stat%e%"source_Col-isDate" <- 
  as.character(sourceEL.net$source_Col-isDate)

#####
      # Generating the EdgeList
      
    ## round 1
      # from "_netEdge" select "colNames" to be identified with "vertex.names"
      # future attr: name (v/c), ccode (v/n), state_name1 (e/c), 
temp<-
 sourceEL.net[,
              c("state_name1",
                "ccode1")
              ]
print(temp)
            # A tibble: n-rows x 2 <selected colmns>
            # round 1 TOTAL: n-rows x 2 


      ## round 2
        # code still selecting from "_netEdge", add "colNames"
        # future attr: state_name2 (e/c), ccode2 (e/n)
colnames(temp)<-
  c("state_name2",
    "ccode2"
  )
print(temp)
            # A tibble: n-rows x 2 <selected colmns>
            # round 2 TOTAL: n-rows x 2

      ## round 3
        # "rBind" selects "colnames" from "_netEdge" and BINDS them to temp
        # future attr: state_name2 (e/c), ccode2 (e/n)
temp<-
  rbind(temp,
       sourceEL.net[,
                         c("state_name2"
                           ,"ccode2"
                         )])
print(temp)
          # A tibble: n-rows x 2 <selected colmns>
          # round 3 TOTAL: (round 1 n-rows) + (round 2 n-rows) x 2

      ## Temp Final Round !!! is being used as variable in generating an edgelist object
          # temp contains 
            # "Total n-rows", and
            # all future attr: names and classes 
            # (v/c), ccode (v/n), state_name1 (e/c), ccode2 (e/n), state_name2 (e/c)

#####
              #**statnet** Generate Edgelist: w/ attributes 
#               << %v% attribute-name <- value >> extracts "ccode" fromsourceEL.net_ns and assigns new value
sourceEL.stat%v%"ccode"<-
#       assigns temp:ccode2(e/n) to "ccode" 
  temp$ccode2[ 
#                 EXTRACTS << %v%"vertex.names" >>, from #temp:state_name2(e/c) 
    match(sourceEL.stat%v%"vertex.names",temp$state_name2)]
#   match() matches values extracted from #temp:state_name2(e/c) to alliance:state_name2
summary(sourceEL.stat)
          # it's a bloody statnet edgelist !!!

              #**igraph** Generate Edgelist

V(sourceEL.ig)$ccode<-
  temp$ccode2[
    match(V
          (sourceEL.ig)$name,
          temp$state_name2)
  ]
print(sourceEL.ig)




#Let's add a helpful message that will tell users what this script has done.
cat(
  '#################################################################################################
"XXX.R" has imported a network of XXX  Dataset. 

This is a 
  SIZE: large,
  WEIGHT: un/weighted, 
  un/directed network,  
rich with edge attributes. 

The nodes are CASES
and edges are XXX between them. 
For more information see the code book in the XXX data file. 

The import script has created three objects that represent the network:
     -sourceEL.net      (a dataframe of an edgelist and edge attributes)
     -sourceEL.net_ig   (an igraph object)
     -sourceEL.stat     (a network object compatable with statnet packages like sna & ergm)

Each object name starts, quite generically, with "network_" and ends with the type of object it 
is. Note that the names are generic so that they are  compatable with other scripts you will use
in this course. Feel free to rename the objects for your purposes. 
################################################################################################')
