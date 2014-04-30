# mouse_retina.R
# Created by Disa Mhembere on 2014-03-10.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.
# Mouse
# mouse_retina_1.graphml

require(igraph)

load("../data/mouseretina.RData")
mouse_contacts <- mouse_contacts[,2:7]
m.cells.types <- merge(mouse_cells, mouse_types, by=intersect("type_id", "type_id")) 

mcts <- merge(m.cells.types, mouse_somapositions[,2:5], by=intersect("cell_id", "cell_id"), all.x=TRUE)
mcts <- mcts[c("cell_id", "designation", "volgyi_type", "macneil_type", "coarse", "certainty", "x", "y", "z")]

g <- graph.data.frame(mouse_contacts, directed=TRUE, vertices=mcts) 
g$sensor <- "Electron Microscopy"
g$source <- "https://github.com/ericmjonas/circuitdata/tree/master/mouseretina" #"Automatic discovery of cell types and microcircuitry from neural connectomics. Eric Jonas and Konrad Kording, submitted"
g$region <- "retina"

write.graph(g, "../graphs/mouse_retina_1.graphml", format="graphml")


