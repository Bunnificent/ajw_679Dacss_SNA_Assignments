
# Week 1: *Describe Network Data*
## 1. **List and inspect:** 
List the objects to make sure the datafiles are working properly:
  ```is()
```

## 2. **Network Size:**
What is the size of the network?
  
  **[igraph]**
  Count of vertices
```vcount(DataSet.ig)
```
Count of edges
``` ecount(DataSet.ig)
```
**[statnet]**
  Network Attributes: count vertices and edges 
```print(DataSet.stat)
```

## 3. **Network Features:**

**[igraph]**    
  Is this a Bipartite or single mode network?
  ``` is_bipartite(DataSet.ig)
```

Are edges directed or undirected?
  ```is_directed(DataSet.ig)
```

Are edges weighted or unweighted?
  ```is_weighted(DataSet.ig)
```

**[statnet]**
  Find network features
```print(DataSet.stat)
```

## 4. **Network Attributes:**
R commands used with vector objects also work with network attribute data
```sort()
```
```summary()
```

**[igraph]**
  ```summary(
    E(
      DataSet.ig
    )
    $weight
  )
```

**[statnet]**
  ``` summary(
    DataSet.stat 
    %e% 
      "weight"
  )
```

*Accessing Attribute Data*
  - When we work with an R dataframe object, you can access a specific variable in the dataframe by using the >data$varname< or >$ command<
  
  **[igraph]**
  access vertex attribute 
```V(
  DataSet.ig
)
$name
```
access edge attribute
```E(
  DataSet.ig
)
$weight
```

**[statnet]**
  access vertex attribute
```head(
  DataSet.stat 
  %v% 
    "vertex.names"
)
```
access edge attribute
``` head(
  DataSet.stat 
  %e% 
    "weight"
)
```



Generate a list the names of vertex and edge attributes of the network data.
**[igraph]**
  Names- Vertex Attributes
```igraph::vertex_attr_names(climate.ig)
```
Names- Edge Attributes
```igraph::edge_attr_names(climate.ig)
````

**[statnet]**
  Names- Vertex Attributes
```network::list.vertex.attributes(climate.stat)
```
Names- Edge Attributes
```network::list.edge.attributes(climate.stat)
```




# Week2: *Network Structure: Overview*
- Dyads and Dyad Census
*dyad census* gives the number of dyads where the relationship is:
  - Reciprocal (mutual), or mut
- Asymmetric (non-mutual), or asym, and
- Absent, or null

- Triads and Triad Census
*triad census* provides a fundamental descriptive insight into the types of triads found in a dataset 

- Network Transitivity / Global Clustering
*Transitivity* is a network-level statistic that captures the proption of connected triads in the network that are complete (all three possible links present)
*Transitivity* varies between 0 [no connected triads] and 1 [all connected triads are transitive]

- Local Transivity or Clustering
Local transitivity (*local clustering coefficient*) is the density of an ego network
*average clustering coefficient* average of local transivity for all vertices in a graph

- Path Length & Geodesic

- Component Structure and Membership

## Dyad Census 
Classifies all dyads in the network as:
  - Reciprocal (mutual), or mut
- Asymmetric (non-mutual), or asym, and
- Absent, or null

**[igraph]**
  ```igraph::dyad.census(gotbook.ig)
```  
**[statnet]**
  ```sna::dyad.census(gotbook.stat
                      ```
                      
                      ## **Triad Census**
                      Classifies all triads in the network
                      
                      **[igraph]**
                        ``` igraph::triad_census(gotbook.ig)
                      ```
                      **[statnet]**
                        Undirected Network
                      ``` sna::triad.census(gotbook.stat, mode="graph")```
                      Directed Detwork
                      ``` sna::triad.census(gotbook.stat, mode=)```
                      
                      ## Transitivity: **Global Clustering**
                      
                      network transitivity:
                        **[igraph]**
                        ``` transitivity(gotbook.ig)
                      ```
                      weighted network transitivity:
                        ```igraph::transivity()
                      ```
                      
                      **[statnet]**
                        weighted network transitivity:
                        ``` sna::gtrans()
                      ```
                      For Directed Networks - network structure rooted in hierarchy
                      ```gtrans()
                      ```
                      
                      
                      ## Transivity: **Local Clustering**
                      
                      **[igraph]**
                        
                        1. Retrieve a list of the three vertices we are interested  
                      
                      ``` V(gotbook.ig)
                      [c(
                        "vertex_attr_names",
                        "vertex_attr_names",
                        "vertex_attr_names"
                      )]
                      ```
                      
                      2. Check ego network transitivity
                      
                      ```transitivity(
                        gotbook.ig,
                        type="local",
                        vids=V(gotbook.ig)
                        [c(
                          "vertex_attr_names",
                          "vertex_attr_names",
                          "vertex_attr_names"
                        )]
                      ) 
                      ```  
                      
                      Global clustering cofficient
                      ```transitivity(gotbook.ig,
                                      type="global"
                      )
                      ```
                      
                      Average local clustering coefficient
                      ```transitivity(gotbook.ig,
                                      type="average"
                      )
                      ```
                      
                      # *INCOMPLETE* Advanced [Week 2]
                      ## ADVANCED: Path Length and Geodesic
                      ## ADVANCED Component Structure and Membership
                      