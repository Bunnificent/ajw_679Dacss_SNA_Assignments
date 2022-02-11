library(network)

#           Network Formation 
        #### check for adjacency vs edgelist 
#####
passIt <- smugCovIdx
dim(passIt)
  #####
        #### Edgelist: Network Formation
            ## NOTE: Edgelist Format
#####
            ## network data is nx2 (or more with edge attributes)
            ## first column is "From", 
            ## second column is "To"
  #####
          ### Edgelist: inspect column names
              ## inspect column names as 3rd-kth columns of network_data may include network attributes
colnames(passIt)
  #####

#####
#       Format DF to become an edgelist
#####
      ###
      passIt
#     rows: 4
#     columns: 672
#     colnames: 
              c("dnkName",#c1
              "dnkIng", #c2
              "dnkCode",#c3
              "classIng") #c4 
      # Assign modified source.df to Edge List variable name 
        passIt <- 
        passIt[c( #select column numbers from source.Data in order to be added
                2,# dnkIng 
                3,# dnkCode
                1,# dnkName
                4)# classIng
              ]

summary(passIt)
#####


