# cell.R
# Created by Disa Mhembere on 2014-03-10.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

require(igraph)
# mmc2
dat <- read.table("../data/mmc2/p.pacificus_synaptic.connectivity.specimen148.csv", header=TRUE, sep=",")
dat <- dat[,1:3]
g <- graph.data.frame(dat, directed=TRUE)
g$source <- "http://www.sciencedirect.com/science/MiamiMultiMediaURL/1-s2.0-S0092867412015000/1-s2.0-S0092867412015000-mmc2.xlsx/272196/FULL/S0092867412015000/d8aec31a81fa121e3fe2a69348ead3b5/mmc2.xlsx" #"http://www.sciencedirect.com/science/article/pii/S0092867412015000"
g$info  <- "source=presynaptic, target=postsynaptic"
g$sensor <- "Electron Microscopy"
g$region <- "neural synaptic"
g$DOI <- "10.1016/j.cell.2012.12.013"
write.graph(g, "../graphs/p.pacificus_neural.synaptic_1.graphml", format="graphml") 

dat <- read.table("../data/mmc2/p.pacificus_synaptic.connectivity.specimen107.csv", header=TRUE, sep=",")
dat <- dat[,1:3]
g <- graph.data.frame(dat, directed=TRUE)
g$source <- "http://www.sciencedirect.com/science/MiamiMultiMediaURL/1-s2.0-S0092867412015000/1-s2.0-S0092867412015000-mmc2.xlsx/272196/FULL/S0092867412015000/d8aec31a81fa121e3fe2a69348ead3b5/mmc2.xlsx" #"http://www.sciencedirect.com/science/article/pii/S0092867412015000"
g$sensor <- "Electron Microscopy"
g$info <- "source=presynaptic, target=postsynaptic"
g$region <- "neural synaptic"
g$DOI <- "10.1016/j.cell.2012.12.013"
write.graph(g, "../graphs/p.pacificus_neural.synaptic_2.graphml", format="graphml")

# mmc3
dat <- read.table("../data/mmc3/p.pacificus_concensus_network.csv", header=TRUE, sep=",")
dat <- dat[,1:5]
g <- graph.data.frame(dat, directed=TRUE)
g$source <- "http://www.sciencedirect.com/science/MiamiMultiMediaURL/1-s2.0-S0092867412015000/1-s2.0-S0092867412015000-mmc3.xlsx/272196/FULL/S0092867412015000/53c28b2c628581938ef4380a1cf44002/mmc3.xlsx" # "http://www.sciencedirect.com/science/article/pii/S0092867412015000"
g$sensor <- "Electron Microscopy"
g$info <- "source=presynaptic, target=postsynaptic"
g$DOI <- "10.1016/j.cell.2012.12.013"
g$region <- "neural synaptic"
write.graph(g, "../graphs/p.pacificus_neural_concensus.network_1.graphml", format="graphml")

# mmc4
dat <- read.table("../data/mmc4/c.elegans_synapse.classes.weighted.multiplicity.of.synapses.csv",header=TRUE, sep=",")
dat <- dat[,1:3]
g <- graph.data.frame(dat, directed=TRUE)
g$source <- "http://www.sciencedirect.com/science/MiamiMultiMediaURL/1-s2.0-S0092867412015000/1-s2.0-S0092867412015000-mmc4.xlsx/272196/FULL/S0092867412015000/9e6305a94d99800c42fc274c2863f7e8/mmc4.xlsx" # "http://www.sciencedirect.com/science/article/pii/S0092867412015000"
g$sensor <- "Electron Microscopy"
g$info <- "source=presynaptic, target=postsynaptic"
g$DOI <- "10.1016/j.cell.2012.12.013"
g$region <- "neural synaptic"
write.graph(g, "../graphs/c.elegans_neural_multiplicity.synapses_1.graphml", format="graphml")
