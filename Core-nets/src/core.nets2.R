# core.nets.R
# Created by Disa Mhembere on 2014-03-13.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

# Cercor
require(igraph)
dat <- read.table("../data/Cercor_2012 Table.csv", header=TRUE, sep=",", encoding="latin1")
dat <- dat[c("SOURCE",  "TARGET" , "NEURONS", "FLNe", "CASE", "STATUS", "MONKEY", "BIBLIOGRAPHY")]
g <- graph.data.frame(dat, directed=TRUE)
g$DOI <-"10.1093/cercor/bhs270"
g$source <- "http://www.core-nets.org/download/Cercor_2012%20Table.xls"
g$sensor <- "Retrograde tracer"
g$region <- "cerebral cortex"
write.graph(g, "../graphs/rhesus_cerebral.cortex_1.graphml", format="graphml")

# JCN_2013
dat <- read.table("../data/JCN_2013 Table.csv", header=TRUE, sep=",", encoding="latin1")
names(dat)[3] <- "SLN_perc"
names(dat)[4] <- "Dist_mm"
dat <- dat[c("From", "To", "Dist_mm", "SLN_perc")]
g <- graph.data.frame(dat, directed=TRUE)
g$DOI <- "10.1002/cne.23458"
g$source <-"http://www.core-nets.org/download/JCN_2013%20Table.xls"
g$sensor <- "Retrograde tracer"
g$region <- "brain"
write.graph(g, "../graphs/rhesus_brain_2.graphml", format="graphml")

# PNAS_2013_DistanceMatrix
dat <- read.table("../data/PNAS_2013_DistanceMatrix.csv", sep=",", encoding="latin1", header=FALSE)
g <- graph.adjacency(as.matrix(dat), weighted=TRUE)
V(g)$name <- c("V1","V2","V4","MT","7m","7A","7B","2","ProM","STPr","STPi","STPc","PBr","Tepd","TEO","F1","5","F2","F7","8B","10","46d","9/46d","9/46v","8m","8l","F5","24c","DP","V1P","V2P","V3","V3A","V4t","Pro.St.","7op","LIP","VIP","MIP","PIP","AIP","V6","V6A","TPt","PGa","IPa","FST","MST","TEOm","PERIRHINAL","TEad","TEav","TEpv","Tea/ma","Tea/mp","ENTORHINAL","TH/TF","SUBICULUM","TEMPORAL_POLE","CORE","MB","LB","PBc","INSULA","Gu","SII","1","3","23","24a","24b","24d","29/30","31","32","F3","F6","F4","9","46v","8r","45B","45A","44","OPRO","OPAI","11","14","25","12","13","PIRIFORM","Pi")
g$source <- "http://www.core-nets.org/index.php?action=download"
g$sensor <- "Retrograde tracer"
g$DOI <- "10.1073/pnas.1218972110"
g$region <- "interareal cortical network"
write.graph(g, "../graphs/rhesus_interareal.cortical.network_2.graphml", format="graphml")

