# Network Formation 

#####
#       Format DF to become an edgelist
#####
      # Assign modified source.df to Edge List variable name 
smugCovIdx_net <- 
  smugCovIdx[c( #select column numbers from source.Data in order to be added
    3,# dnkCode
    1,# dnkName
    2,# dnkIng
    4)# classIng
  ]

summary(smugCovIdx_net)
#####


