#This script imports 


library(statnet)
library(igraph)

# The import script has created three objects that represent the network:
#   - sourceEL_ig (a dataframe of an edgelist and edge attributes)
#   - sourceEL_ig_ig (an igraph object)
#   - snEL  (a network object compatable with statnet packages like sna & ergm)


#######
      #Lets read the data into the enviroment.

source_df<-smugCovIdx

#####
    #Format DF to become an edgelist
    
    # Assign modefied source_dfto Edge List variable name 
sourceEL <- 
 source_df[c( #select column numbers from source.Data in order to be added
   1:4)]

summary(sourceEL)


#####
    #**igraph** version of the network
          # NOTE: igraph automatically adds edge attributes, but not vertices 
    
    #First let's create the object. 
sourceEL_ig <- graph_from_data_frame(d = sourceEL, 
                        directed = FALSE)

print(summary(sourceEL_ig))
#####
    #**statnet** object from our edgelist
          # Will not have vertex
          # Will not have edge attributes

    #First we make and EMPTYobject. 
snEL <- 
  network(as.matrix
          (sourceEL[], 
            matrix.type = 'edgelist',
            directed = TRUE))

#######**VERIFY**
        network::list.vertex.attributes(snEL)
        network::list.edge.attributes(snEL) 

#**Purge* unwanted attributes
network::delete.vertex.attribute(snEL,"  ")
network::delete.edge.attribute(snEL,"  ")


#**Assign:**VERTICES atributes <aka colnames>
snEL%v%"vertex.names"<- sourceEL$intTyp
snEL%v%"ingNam"<- sourceEL$ingNam
        
#**Assign:** edge atributes <aka colnames>        
        
snEL%e%"dnkIng" <- sourceEL$dnkIng
snEL%e%"dnkNam" <- sourceEL$dnkNam

#######**VERIFY**
print(snEL)
network::list.vertex.attributes(snEL)
network::list.edge.attributes(snEL)       

          # it's a bloody statnet edgelist !!!

     
     
     
              #**igraph** Generate Edgelist

V(sourceEL_ig)$ccode<-
  temp$ccode2[
    match(V
          (sourceEL_ig)$name,
          temp$state_name2)
  ]
print(sourceEL_ig)



