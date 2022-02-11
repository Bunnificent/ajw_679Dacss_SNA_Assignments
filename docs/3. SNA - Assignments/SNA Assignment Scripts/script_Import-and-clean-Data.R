```{r}
library(tidyr)
library(readr)

smugCovIdx <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. Sp22_rProjects/Dacss_679- Coursework/GIT-ajw_Learning-SocialNetworkAnalysis/docs/3. SNA-Data/index-by_name-Smuggler_Cove-cocktail_recipies.csv", 
                       col_names = FALSE, 
                       col_types = cols(X1 = col_skip(), 
                                                        X4 = col_skip()))
smugDnkIdx_df <- smugCovIdx

# DATA Cleaning

#####
Extract variables
#####
library(stringr)
          # extract first word of the column, adds values in new Column at the end of DF
smugDnkIdx_df$substring_first <- 
  str_extract(smugDnkIdx_df$X5,
              "(\\w+)") 
smugDnkIdx_df
#####
#####

#####
Drop it like...
#####
      # DROP COLUMNS FROM DATA FRAME
smugDnkIdx_df = subset(smugDnkIdx_df, 
                       select = -c(3)
                       )

      # Drop Colmns without values 
drop_na(smugDnkIdx_df)

      # Drop NA rows
smugDnkIdx_df <- na.omit(smugDnkIdx_df) 
#####
#####

#####
Give Varriables a human name
#####
# rename column names with human language
names(smugDnkIdx_df)[1] <- "dnkName"
names(smugDnkIdx_df)[2] <- "dnkIng"
names(smugDnkIdx_df)[3] <- "dnkCode"   
names(smugDnkIdx_df)[4] <- "classIng"

```

