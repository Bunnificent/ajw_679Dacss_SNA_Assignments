
#Lets read the data into the enviroment.
#This will import it formatted as an edgelist
source_netEdge <- sourceData
source_netEdge <- source_netEdge[c(3,5,2,4,1,6:19)]


#Lets create an statnet object from our edgelist
#First we make the object. It will have no vertex or edge attributes
sourceEL_sn <- 
  network(as.matrix(source_netEdge[1:2], 
                    matrix.type = 'edgelist')
  )

#**%e%** Let's add edge atributes, do not include the colNames for edge vertex
sourceEL_sn%e%"source_edgeAt"      <- source_netEdge$source_edgeAt
sourceEL_sn%e%"source_edgeAt"     <- source_netEdge$source_edgeAt
sourceEL_sn%e%"source_edgeAt"    <- source_netEdge$source_edgeAt
sourceEL_sn%e%"source_edgeAt_date"    <- as.character(source_netEdge$source_edgeAt_date)
sourceEL_sn%e%"source_edgeAt_end_date"   <- as.character(source_netEdge$source_edgeAt_date)


# Generating the EdgeList

##**round**
          # from "_netEdge" select "colNames" to be identified with "vertex.names"

temp <- source_netEdge[,c("vertex_1", "vCode1")]



##**round 2**
            # code still selecting from "_netEdge", add "colNames"

colnames(temp)<- c("vertex_2", "vCode2")


##**round 3**
            # "rBind" selects "colnames" from "_netEdge" and BINDS them to temp

temp<- rbind(temp, source_netEdge[, c("vertex_2" ,"vCode2")])
print(temp)


##**final round** !!! is being used as variable in generating an edgelist object
                # temp contains 
        

sourceEL_sn%v%"vCode1"<- 
  temp$vCode2[match(sourceEL_sn%v%"vertex.names",
                    temp$vertex_2)]

summary(sourceEL_sn)
# it's a bloody statnet edgelist 