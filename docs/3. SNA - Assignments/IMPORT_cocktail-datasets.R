# 1. Read raw data into R
# Load csv files directly into R environment
    # data.frame
    death-drinkRecipie <- cocktail_recipies.DeathAndCom
    smugglers-drinkIndex <- index.by_name.Smuggler_Cove.cocktail_recipies
    pdt-drinkIndex <-  index_by_name_Please_Dont_Tell_cocktail_recipies
        # spec_tbl_df- needs formatting
      index_by_ingredient.Please_Dont_Tell.cocktail_recipies
      
#Load your dataset into the environment#

      library(readr)
      
    leConRecip <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/cocktail_recipies_(by bartender)-le cocktail connoisseur.csv")
      View(leCon-recipies)
    
   
      deathCoRecip <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/cocktail_recipies-DeathAndCo.csv")
      View(deathCoRecip)
      
      pdtDrinks <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/index-by_name-Please_Dont_Tell-cocktail_recipies.csv")

      smugCovDrinks <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/index-by_name-Smuggler_Cove-cocktail_recipies.csv")
      View(smugCovDrinks)

      
# 2. Identify critical features of data:
      #- edgelist or adjacency matrix format
      #- weighted or binary edges
      #- single mode or affiliation (bipartite)
      #- symmetric or directed

# 3. Create a network data object

# 4. If required, assign node and edge attributes