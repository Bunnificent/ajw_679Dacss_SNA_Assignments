


# 1. Read raw data into R
# Load csv files directly into R Files and use auto-import function

#Load your dataset into the environment#
## 1.  [**Identify an existing data set.**]{.ul}


```{r Set Working Directory, include=FALSE}
getwd()

setwd("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA - Assignments")

```
#Lets read the data into the environment.

```{r Read raw data into R}

library(readr)

indx_SmugglerCove_recip <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/index-by_name-Smuggler_Cove-cocktail_recipies.csv", 
                                    col_names = FALSE, col_types = cols(X1 = col_skip(), 
                                                                        X4 = col_skip()), na = "empty")

View(indx_SmugglerCove_recip)
summary(indx_SmugglerCove_recip)

# Smuggler's Cove

smugDnkIdx_df <- indx_SmugglerCove_recip

problems(smugDnkIdx_df)
```

#     _Recip variables contain complete recipies, with measurements in a 
#     classic spreadsheet Rows contain = individual cases / Columns contain attribute data

      # le Cocktail Connoisseur webscrape.
        ## Unique because it includes Bartenders and Bars drinks are attributed to

      # Death & Company's cocktail recipie book
        # It's really long because all each column class of ingredients <Spirits, Liqueur, Juice, Garnish, Bitters, et al>

      # Please Don't Tell

      # Smuggler's Cove


## possible adjacency matrix


## possible edgelists

# 2. Identify critical features of data:
      #- edgelist or adjacency matrix format
      #- weighted or binary edges
      #- single mode or affiliation (bipartite)
      #- symmetric or directed

# 3. Create a network data object

# 4. If required, assign node and edge attributes