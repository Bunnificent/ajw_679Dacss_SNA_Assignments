





plotIngType <- ingTypeEL_Dig

######
      ### iGraph: Directed: Degree Centrality
######
ingTypeEL_Dig

plot(ingT_deg, 
     vertex.size = V(ingT_deg)$degree*2, # sized by degre
     vertex.color = "PINK",
     vertex.frame.color = "PURPLE",
     vertex.label.cex = .75, 
     vertex.label = NA, 
     edge.width = 6,
     edge.color = "blue",
     edge.arrow.size = .01) 


vertex.size=3,
vertex.color = "blue",
vertex.frame.color = NA,
vertex.label = NA,
edge.curved = 1.7,
.3, 
edge.width = .5)
      ######
######
      ### iGraph: Directed: Betweenness Centrality
######

plot(ingTypeEL_Between, 
     vertex.size = V(ingTypeEL_Between)$betweenness, # sized by betweenness
     vertex.color = "blue",
     vertex.frame.color = "grey",
     vertex.label.cex = .6, 
     vertex.label = NA, 
      edge.width = .5, 
     edge.color = "orange",
     edge.arrow.size = .01,
     edge.curved = 2) 

      #####
######
### iGraph: UnDirected: UnDirected:  Closeness Centrality
######
plot(ingTyp_Cent,
     vertex.label.cex = .6,
     vertex.color = "blue",
     vertex.frame.color = "purple",
     vertex.size = V(ingTyp_Cent)$closeness/max(V(ingTyp_Cent)$closeness) * 20,
     vertex.label = NA, 
     edge.width = .5, 
     edge.color = "purple",
     edge.arrow.size = .01,
     edge.curved = .75) 
        ######

######
### iGraph: Directed: Eigenvector Centrality
######

plot(ingTyp_Vector,
     vertex.size = V(ingTyp_Vector)$eigenvector/max(V(ingTyp_Vector)$eigenvector)*100,
     vertex.label = NA,
     vertex.color = "pink",
     vertex.frame.color = "green",
     edge.width = .5, 
     edge.color = "black",
     edge.arrow.size = .5)
     

######
### iGraph: Directed: Bonacich Centrality
######

plot(ingTyp_Cent,
     vertex.size = V(ingTyp_Cent)$bonacich/max(V(ingTyp_Cent)$bonacich) * 20,
     vertex.label.color = "black",
     vertex.color = "purple",
     vertex.frame.color = "green",
     edge.color = "pink")
     

plot(ingTyp_Cent,
     vertex.label = NA, 
     vertex.size = V(ingTyp_Cent)$bonacich/max(V(ingTyp_Cent)$bonacich) * 50,
     vertex.color = "gray",
     edge.color = "blue")
######
######
      ### iGraph: Directed: Page Rank
######

plot(ingTyp_Cent,
     vertex.label.cex = .6, 
     vertex.label = NA, 
     vertex.size = V(ingTyp_Cent)$page_rank/max(V(ingTyp_Cent)$page_rank)*20)






###**Plot Name: smugDIG_plot-R_blue-curved-small*
#####
plot(plotIngType, 
     vertex.size=3,
     vertex.color = "blue",
     vertex.frame.color = NA,
     vertex.label = NA,
     edge.curved = 1.7,
     edge.arrow.size = .3, 
     edge.width = .5)
#####
###**Plot: Kamada Kawai **
###**Plot Name** smugDig_kamadaLayout_ingType
######
# run the layout function on our graph

kamadaLayout <-
  layout.kamada.kawai(plotIngType)

# change the default layout setting to equal the layout we generated above
plot(plotIngType, 
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
###**Plot Name** smugDig_Frucherman-Reingold-ingType
#####
# run the layout function on our graph
fruchtermanLayout <- 
  layout.fruchterman.reingold(plotIngType)

# and then we change the default layout setting to equal the layout we generated above
            

plot(plotIngType, 
     vertex.size = 6, 
     vertex.color= "grey",
     vertex.label.cex = .5, 
     vertex.label.color = "navy", 
     edge.with = 1,
     edge.curved = 5,
     edge.arrow.size = 0.1)

#####

###############
##### Plotting: Plotting based on attributes
###############
##### 
###**Plot: Color & Attribute**
###**Plot Name:smug_Dig-Color-vs-$name**
#####
# Plot by $edgeAttribute and $color

vertex.attributes(plotIngType)

V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "BITTERS"  , "red", "grey")
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "BITTERMENS 'ELEMAKULE TIKI BITTERS", "RED", "grey")
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "PEYCHAUD'S BITTERS", "RED", "grey")
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "SYRUP", "pink", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "DEMERARA SYRUP", "pink", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "CINNAMON SYRUP", "pink", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "LIME JUICE", "YELLOW", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "ORANGE JUICE", "YELLOW", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "JUICE", "YELLOW", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType ==  "PUNT E MES", "purple", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "VERMOUTH" , "purple", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "RUM", "blue", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "GIN", "blue", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "TEQUILA BLANCO", "blue", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "RUM", "blue", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "CRÈME DE CASSIS" , "light blue", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "AMARO" , "light blue", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "AMARO DI ANGOSTURA" , "light blue", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "PORT", "light blue", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "EGG", "black", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "CREAM", "black", V(plotIngType)$color)
V(plotIngType)$color <- ifelse(V(plotIngType)$ingType == "EGG", "black", V(plotIngType)$color)

plot(plotIngType, 
     vertex.size = 3, 
     vertex.frame.color = "GREY", 
     edge.color = "black",
     edge.curved = .5, 
     edge.arrow.size = .3,
     vertex.label.cex = .5)

#####
##### 
###**Plot: erdos.renyi.game - random graph **
###**Plot Name: plotIngTypeRandoG**
#####
plot(plotIngTypeRandoG, 
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
plot(plotIngType, 
     vertex.size = 8, 
     vertex.label = NA,
     vertex.color = "orange", 
     edge.color = "blue",
     edge.width = 2,
     edge.arrow.size = 0.5,
     edge.curved = 1)

plot(plotIngType, 
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

