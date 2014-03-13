# fly.R
# Created by Disa Mhembere on 2014-03-13.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

require(igraph)
dat <- read.table("../data/fly.csv", header=TRUE, sep=",")
dat <- dat[c("presynaptic",  "postsynaptic" , "pre.x", "post.x", "pre.y", "post.y", "pre.z", "post.z","proofreading.details")]
g <- graph.data.frame(dat, directed=TRUE)
g$source <- "http://www.nature.com/nature/journal/v500/n7461/full/nature12450.html"
g$sensor <- "Electron Microscopy"
g$region <- "medulla"
g$DOI <- "10.1038/nature12450"
g$info <- "source=presynaptic, targe=postsynaptic"
write.graph(g, "../graphs/drosophila_medulla_1.graphml", format="graphml")
