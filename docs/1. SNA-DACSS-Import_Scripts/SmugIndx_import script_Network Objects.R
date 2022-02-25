      # read the data into Code Block

source_df<-smugCovIdx

#####
    #Format DF to become an edgelist

sourceEL <- source_df[
  c( #select column numbers from source.Data in order to be added
   1:4)]

summary(sourceEL)

#####
library(statnet)
#####

#####
    #**STATNET** object from edgelist
          # No vertex attribute data
          # No edge attribute data

    #**Create object.**
snEL <- 
  network(as.matrix
          (sourceEL[1:2], 
            matrix.type = 'edgelist'))

      #######**VERIFY**
              print(snEL)               
              network::list.vertex.attributes(snEL)
              network::list.edge.attributes(snEL)
              View(snEL%v%"vertex.names")
                  
#**Assign:**VERTICES atributes <aka colnames>

 
 snEL%v%"dNam"<- sourceEL$dnkNam
 snEL%v%"iNam"<- sourceEL$ingNam
        
      #######**VERIFY**
              network::list.vertex.attributes(snEL)
              summary(snEL%v%"iNam")
              View(snEL%v%"dNam")
              View(snEL%v%"iNam")
              view(snEL%v%"vertex.names")
              
#**Assign:** edge atributes <aka colnames>        
      
snEL%e%"ingTyp" <- sourceEL$ingTyp
# snEL%e%"dnkNam" <- sourceEL$dnkNam

        #######**VERIFY**
                network::list.edge.attributes(snEL)       

#**Purge* unwanted attributes
          network::delete.vertex.attribute(snEL,"na")
         # network::delete.vertex.attribute(snEL,"vertex.names")
          network::delete.edge.attribute(snEL,"na")
  
  #######**VERIFY**
          network::list.vertex.attributes(snEL)
          network::list.edge.attributes(snEL)
          class(snEL)
          print(snEL)
#
##          
###
###** it's a bloody statnet edgelist !!! **###
         
     
          
#####
library(igraph)
#####

#**IGRAPH**
          # NOTE: igraph automatically adds edge attributes, but not vertices 
          #              [1] "dnkNam" "ingNam" "dnkIng" "ingTyp"
#**Create Edgelist Matrix** 

sourceEL_mx = 
            as.matrix(source_df[1:2],
                      matrix.type = "edgelist",
                       directed=F)

          class(sourceEL_mx)          
          dim(sourceEL_mx)
          view(summary(sourceEL_mx))
          ##**Note** Var 1 is empty, Var 2 Contains edgelist          
          
          
#**Create igraph object** 
         
igEL <- graph.edgelist(sourceEL_mx, directed = T)
          
          summary(igEL)
          view(edge_attr(igEL)) 
          view(vertex.attributes(igEL))
          
          
#**add/remove** edge attribute ...because it's easy...#

E(igEL)$ingTyp<-source_df$ingTyp
# E(igEL)$dnkNam<-source_df$dnkNam

        summary(igEL)
        view(edge_attr(igEL)) 
        
         
#**create vertex attributes** in igraph
 
set_vertex_attr(igEL,
                name = "dNam",
                value = source_df[c("dnkNam")])
V(igEL)$dNam<-source_df$dnkNam



set_vertex_attr(igEL,
                name = "iNam",
                value = source_df[c("ingNam")])
V(igEL)$iNam<-source_df$ingNam


# E(igEL)$dnkNam<-source_df$dnkNam

          summary(igEL)
          View(igEL)
          view(edge_attr(igEL))
          view(vertex_attr(igEL))
                  
######
#          From Benath You it Devours
#####          
#**Create object**
tIGel <- graph_from_data_frame(d = sourceEL, 
                              directed = FALSE)

E(tIGel)$dnkIng<-source_df$dnkIng
E(tIGel)$dnkNam<-source_df$dnkNam          
          

          
          
          #######**VERIFY**
          #######*
          #######*
          #######*
          class(IGel)
          print(IGel)          
          view(igraph::edge_attr_names(IGel))
          view(igraph::vertex_attr_names(smugEL_ig))
          
#**Assign:**VERTICES atributes <aka colnames>

vertex_attr(IGel, name = "dnkIng", index = V(graph)) <- 
  value

print(IGel)



