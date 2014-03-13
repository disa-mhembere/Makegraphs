# C.elegans
# celegans.herm_nematode.pharynx_1.graphml
require(igraph)
load("../data/celegans_herm.RData")
celegans_synapses <- celegans_synapses[,2:5]
names(celegans_synapses)[4] <- "weight"
g <- graph.data.frame(celegans_synapses, directed=TRUE) # <from, to, [attr[attr ..]]>
g$sensor <- "Electron Microscopy"
# From: https://basecamp.com/1792632/projects/267931-open-connectome/todos/81640018-for-all-graphs#comment_127244428
g$source <- "Automatic discovery of cell types and microcircuitry from neuralconnectomics Eric Jonas and Konrad Kording, submitted"
V(g)[celegans_cells["cell_id"]$cell_id]$cell_name <- celegans_cells["cell_name"]$cell_name
V(g)[celegans_cells["cell_id"]$cell_id]$cell_class <- celegans_cells["cell_class"]$cell_class
V(g)[celegans_cells["cell_id"]$cell_id]$soma_pos <- celegans_cells["soma_pos"]$soma_pos
V(g)[celegans_cells["cell_id"]$cell_id]$neurotransmitters <- celegans_cells["neurotransmitters"]$neurotransmitters
V(g)[celegans_cells["cell_id"]$cell_id]$role <- celegans_cells["role"]$role
g$info <- "weight = count of synapses"
g$region <- "pharynx"
write.graph(g, "../graphs/celegans.herm_pharynx_1.graphml", format="graphml")

