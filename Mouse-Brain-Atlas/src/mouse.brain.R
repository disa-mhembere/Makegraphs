# mouse.brain.R
# Created by Disa Mhembere on 2014-04-30.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

# contralateral, ipsilateral, p_value(statistical confidence), 
require(igraph)

# Pvalue_contra
dat <- read.table("../data/PValue_contra-Table 1.csv", header=TRUE, sep=",") # Pvalue contralateral
dat[is.na(dat)] <- 0
mdat <- as.matrix(dat[,2:length(dat)])
gpval.contra <- graph.adjacency(mdat, weighted=TRUE)
E(gpval.contra)$pvalue_contra_weight <- E(gpval.contra)$weight
gpval.contra <- remove.edge.attribute(gpval.contra, "weight")

# W_contra
dat <- read.table("../data/W_contra-Table 1.csv",header=TRUE, sep=",")
dat[is.na(dat)] <- 0
mdat <- as.matrix(dat[,2:length(dat)])
gw.contra <- graph.adjacency(mdat, weighted=TRUE)
E(gw.contra)$w_contra_weight <- E(gw.contra)$weight
gw.contra <- remove.edge.attribute(gw.contra, "weight")

# Pvalue_ipsi
dat <- read.table("../data/PValue_ipsi-Table 1.csv",header=TRUE, sep=",")
dat[is.na(dat)] <- 0
mdat <- as.matrix(dat[,2:length(dat)])
gpval.ipsi <- graph.adjacency(mdat, weighted=TRUE)
E(gpval.ipsi)$pvalue_ipsi_weight <- E(gpval.ipsi)$weight
gpval.ipsi <- remove.edge.attribute(gpval.ipsi, "weight")

# W_ipsi
dat <- read.table("../data/W_ipsi-Table 1.csv",header=TRUE, sep=",")
dat[is.na(dat)] <- 0
mdat <- as.matrix(dat[,2:length(dat)])
gw.ipsi <- graph.adjacency(mdat, weighted=TRUE)
E(gw.ipsi)$w_ipsi_weight <- E(gw.ipsi)$weight
gw.ipsi <- remove.edge.attribute(gw.ipsi, "weight")

g <- graph.union(gw.contra, gpval.contra, gpval.ipsi, gw.ipsi)

g$source <- "http://www.nature.com/nature/journal/v508/n7495/extref/nature13186-s4.xlsx"
g$region <- "brain"
g$sensor <- "Enhanced green fluorescent protein"
g$DOI <- "10.1038/nature13186"
write.graph(g, "../graphs/mouse_brain_1.graphml", format="graphml")
