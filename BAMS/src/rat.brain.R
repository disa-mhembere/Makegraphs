# rat.brain.R
# Created by Disa Mhembere on 2014-03-12.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

require(igraph)
# 2011
dat <- read.table("../data/bams_grid_rat_brain_2011.csv", header=TRUE, sep=",")
mdat <- as.matrix(dat)
g <- graph.adjacency(mdat[, 2:dim(mdat)[2]], weighted=TRUE)
g$source <- "http://brancusi1.usc.edu/connectome/2011/"
g$region <- "brain"
g$sensor <- "neuroanatomical experiments"
write.graph(g, "../graphs/rattus.norvegicus_brain_1.graphml", format="graphml")

# 2012
dat <- read.table("../data/bams_grid_rat_brain_2012.csv", header=TRUE, sep=",")
mdat <- as.matrix(dat)
g <- graph.adjacency(mdat[, 2:dim(mdat)[2]], weighted=TRUE)
g$source <- "http://brancusi1.usc.edu/connectome/2012/3/"
g$region <- "brain"
g$sensor <- "neuroanatomical experiments"
write.graph(g, "../graphs/rattus.norvegicus_brain_2.graphml", format="graphml")

# 2013
dat <- read.table("../data/bams_grid_rat_brain_2013.csv", header=TRUE, sep=",")
mdat <- as.matrix(dat)
g <- graph.adjacency(mdat[, 2:dim(mdat)[2]], weighted=TRUE)
g$source <- "http://brancusi1.usc.edu/connectome/2013/1/"
g$region <- "brain"
g$sensor <- "neuroanatomical experiments"
write.graph(g, "../graphs/rattus.norvegicus_brain_3.graphml", format="graphml")
