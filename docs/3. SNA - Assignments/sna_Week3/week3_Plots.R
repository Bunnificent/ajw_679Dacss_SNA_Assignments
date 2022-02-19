
###############
              ##### Plotting: iGraph
###############
library(igraph)
#####
#####
          #  read a summary of it by typing its name into R
smugEL_ig

          # View values in “name” attribute with the V()$ function.
 print(V(smugEL_ig)$name)

 #####
      ### plot: basic R 
      plot(smugEL_ig)
      plot(ingTypeEL_Dig)
 
      #####
        ###**Plot Name: smugIG_plot-R_blue-curved-small*
#####
plot(smugEL_ig, 
     vertex.size=3,
     vertex.color = "blue",
     vertex.frame.color = NA,
     vertex.label = NA,
     edge.curved = 1.7,
     edge.arrow.size = .3, 
     edge.width = .5)
      #####
        ###**Plot: Kamada Kawai **
            ###**Plot Name** igraph_kamadaLayout_smug
######
      # run the layout function on our graph
 
 kamadaLayout <-
   layout.kamada.kawai(smugEL_ig)
 
        # change the default layout setting to equal the layout we generated above
 plot(smugEL_ig, 
      layout = kamadaLayout, 
      vertex.size = 3, 
      vertex.color = "black", 
      vertex.frame.color = NA, 
      vertex.label.cex = .7,  
      vertex.label = NA, 
      edge.curved = .3, 
      edge.arrow.size = .1, 
      edge.width = .5)
    ##### 
      ###**Plot: Frucherman-Reingold **
   ###**Plot Name** igrap-smugEL_Frucherman-Reingold
#####
      # run the layout function on our graph
 fruchtermanLayout <- 
   layout.fruchterman.reingold(smugEL_ig)
 
 # and then we change the default layout setting to equal the layout we generated above
 
 plot(smugNet, 
      vertex.size = 6, 
      vertex.color= "orange",
      vertex.label.cex = .5, 
      vertex.label.color = "black", 
      edge.with = .5,
      edge.curved = 5,
      edge.arrow.size = 0.1)
 
    #####
   
###############
                ##### Plotting: Plotting based on attributes
###############
          ##### 
              ###**Plot: Color & Attribute**
              ###**Plot Name**
#####
      # Plot by $edgeAttribute and $color
 
 V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name == "PUKA PUNCH", "red", "yellow")
  V(smugEL_ig)$color <- NA
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name == "RUMBUSTION PUNCH", "red","yellow")
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name == "TRIUMVIRATE PUNCH", "red", V(smugEL_ig)$color)
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name == "KAHIKO PUNCH", "red", V(smugEL_ig)$color)
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name == , "black", V(smugEL_ig)$color)
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name ==  "DOCTOR FUNK" , "green",V(smugEL_ig)$color)
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name ==  "AKU AKU", "green",V(smugEL_ig)$color)
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name ==  "JET PILOT" , "green",V(smugEL_ig)$color)
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name == "SINGAPORE SLING", "purple", V(smugEL_ig)$color)
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name ==  "SCORPION", "purple", V(smugEL_ig)$color)
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name == "MAI TAI", "purple", V(smugEL_ig)$color)
  V(smugEL_ig)$color <- ifelse(V(smugEL_ig)$name == "MEXICAN EL DIABLO", "black", V(smugEL_ig)$color)
  
 
      plot(smugEL_ig, 
           vertex.size = 3, 
           vertex.frame.color =  "black", 
           vertex.label.cex = .7, 
           vertex.label = NA, 
           edge.curved = .5, 
           edge.arrow.size = .3)
    #####
    ##### 
          ###**Plot: erdos.renyi.game - random graph **
          ###**Plot Name: smugEL_igRandoG**
 #####
      plot(smugEL_igRandoG, 
           vertex.size = 2, 
           vertex.label = NA, 
           edge.curved = 1, 
           vertex.color = "orange", 
           edge.arrow.size = .1, 
           edge.width = .5, 
           edge.color = "blue")
      
        #####
      
###############
                ##### Plotting: igraph: DEGREE CENTRALITY
###############
######
      ###**Plot: base R *
      ###**Plot Name: Degree Centrality: dnkIng*
######      
      plot(smugNet, 
           vertex.size = 8, 
           vertex.label = NA,
           vertex.color = "orange", 
           edge.color = "blue",
           edge.width = 2,
           edge.arrow.size = 0.5,
           edge.curved = 1)
      
      plot(smugNet, 
           vertex.size = 4,
           vertex.label.size = 1,
           vertex.color = "gray",
           edge.color = "blue",
           edge.widtth = 2,
           edge.arrow.size = 0.25)
      
      #####      
######
      ###
######      
      #####
######
      ###
######
      
      