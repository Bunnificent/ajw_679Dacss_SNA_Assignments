# 1. Read raw data into R
# Load csv files directly into R Files and use auto-import function

#Load your dataset into the environment#

library(readr)

#     _Recip variables contain complete recipies, with measurements in a 
#     classic spreadsheet Rows contain = individual cases / Columns contain attribute data

      # le Cocktail Connoisseur webscrape.
        ## Unique because it includes Bartenders and Bars drinks are attributed to
leConRecip <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/cocktail_recipies_(by bartender)-le cocktail connoisseur.csv")
View(leConRecip)

      # Death & Company's cocktail recipie book
        # It's really long because all each column class of ingredients <Spirits, Liqueur, Juice, Garnish, Bitters, et al>
deathCoRecip <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/cocktail_recipies-DeathAndCo.csv")

      # Please Don't Tell
pdtRecipies <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/index-by_name-Please_Dont_Tell-cocktail_recipies.csv")

      # Smuggler's Cove
smugDrinkIndex <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/index-by_name-Smuggler_Cove-cocktail_recipies.csv")

      
# 2. Identify critical features of data:
      #- edgelist or adjacency matrix format
      #- weighted or binary edges
      #- single mode or affiliation (bipartite)
      #- symmetric or directed

# 3. Create a network data object

# 4. If required, assign node and edge attributes