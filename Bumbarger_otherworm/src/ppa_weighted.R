# ppa_weighted.R
# Created by Disa Mhembere on 2014-03-10.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

require(igraph)
dat <- read.table("../data/ppa_weighted.txt", sep="\t", header=TRUE)
mat <- data.matrix(dat)
g <- graph.adjacency(mat, weighted=TRUE)
g$source <- "http://www.sciencedirect.com/science/article/pii/S0092867412015000"
g$sensor <- "Electron Microscopy"
g$DOI <- "10.1016/j.cell.2012.12.013"
g$region <- "neural"
write.graph(g, "../graphs/p.pacificus_neural_1.graphml", format="graphml")

