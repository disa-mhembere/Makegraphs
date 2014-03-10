# cell.R
# Created by Disa Mhembere on 2014-03-10.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

# TODO: Figure out graph names
require(igraph)
# mmc2
dat <- read.table("./mmc2/p.pacificus_synaptic.connectivity.specimen148.csv", header=TRUE, sep=",")
dat <- dat[,1:3]
g <- graph.data.frame(dat, directed=TRUE)
g$source <- "http://www.sciencedirect.com/science/article/pii/S0092867412015000"
g$info  <- "source=presynaptic, target=postsynaptic"
write.graph(g, "p.pacificus_synaptic.connectivity.specimen148.graphml", format="graphml") 

dat <- read.table("./mmc2/p.pacificus_synaptic.connectivity.specimen107.csv", header=TRUE, sep=",")
dat <- dat[,1:3]
g <- graph.data.frame(dat, directed=TRUE)
g$source <- "http://www.sciencedirect.com/science/article/pii/S0092867412015000"
g$info <- "source=presynaptic, target=postsynaptic"
write.graph(g, "p.pacificus_synaptic.connectivity.specimen107.graphml", format="graphml")

# mmc3
dat <- read.table("./mmc3/p.pacificus_concensus_network.csv", header=TRUE, sep=",")
dat <- dat[,1:5]
g <- graph.data.frame(dat, directed=TRUE)
g$source "http://www.sciencedirect.com/science/article/pii/S0092867412015000"
g$info <- "source=presynaptic, target=postsynaptic"
write.graph(g, "p.pacificus_concensus_network.graphml", format="graphml")

# mmc4
dat <- read.table("./mmc4/c.elegans_synapse.classes.weighted.multiplicity.of.synapses.csv",header=TRUE, sep=",")
dat <- dat[,1:3]
g <- graph.data.frame(dat, directed=TRUE)
g$source <- "http://www.sciencedirect.com/science/article/pii/S0092867412015000"
g$info <- "source=presynaptic, target=postsynaptic"
write.graph(g, "c.elegans_synapse.classes.weighted.multiplicity.of.synapses.graphml", format="graphml")
