# graph.R
# Created by Disa Mhembere on 2014-03-13.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

# Figure 5d)
require(igraph)
g <- graph.empty(n=29, directed=TRUE)

es <- c(2,15 ,3,20, 3,29, 3,22, 3,21 , 3,19 , 3,18 , 4,17, 4,18, 4,19 , 6,29, 6,17, 6,16, 6,2 , 6,14 ,7,16, 8,4, 8,21, 8,22,  8,23, 9,23 ,10,29 ,10,1, 10,27, 10,26 ,10,25 ,10,24, 10,23, 10,20, 10,17 , 11,14, 11,27, 11,26, 11,25, 11,23, 11,28 , 12,1, 12,28, 12,24 , 13,5, 13,2, 13,15, 13,1, 13,29)
w <-  c(1,    2,    1,    1,    1,      2,    2,      1,    2,    1,      6,    2,    1,    1,    1,    1,  1,    1,    1,    2,    3,    1,      1,    1,      1,    1,    1,      2,    1,      13,     3,      1,      1,    1,    3,      1,      1,    2,    1,      1,    2,      2,    1,    1)

g <- add.edges(g, es, weight=w)
V(g)[c(3:13)]$type1 <- "Characterized pyramidal neuron" # Triangle
V(g)[c(1,2,17,21:23,26,29)]$type1 <-"Cell body in EM volume" # Circle
V(g)[c(14:16,18:20,24:25,27,28)]$type1 <- "Dendritic fragment" # square

V(g)[c(24,25)]$type2 <- "Postsynaptic excitatory target"# magenta
V(g)[c(1, 14:23,26:29)]$type2 <- "Postsynaptic inhibitory target"# cyan 

g$info <- "Figure 5b"
g$source <-"http://www.nature.com/nature/journal/v471/n7337/full/nature09802.html"
g$sensor <- "Electron microscopy" 
g$DOI <- "doi:10.1038/nature09802"
g$region <- "cerebral cortex"
write.graph(g, "../graphs/mouse_visual.cortex_1.graphml", format="graphml")

# Figure 5b)
# Interleave function
itlv <- function(a, b) {
  idx <- order(c(seq_along(a), seq_along(b)))
  unlist(c(a,b))[idx]
}

g <- graph.empty(n=195, directed=TRUE)
# 2
g <- g + edges(itlv(rep(2,6), c(15:19,5)), weight=c(3,rep(1,5)))

# 3
el <- c(153:178, 185,186,8,83)
wt <- c(2, rep(1,24), 2, 1, 1, 2, 1)
g <- g + edges(itlv(rep(3,length(el)), el), weight=wt)

# 4
el <- c(177:184,103)
wt <- c(1,2, rep(1,7))
g <- g + edges(itlv(rep(4,length(el)), el), weight=wt)

# 6
el <- c(37:61,83,2, 103)
wt <- c(rep(1,length(37:61)),6,1, 2)
g <- g + edges(itlv(rep(6,length(el)), el), weight=wt)

# 7
el <- c(60:82)
wt <- c(rep(1,9), 2, rep(1,9), 2, 1, 1, 1)
g <- g + edges(itlv(rep(7,length(el)), el), weight=wt)

# 8
el <- c(185:195,4,150)
wt <- c(rep(1, length(el)-1), 2)
g <- g + edges(itlv(rep(8,length(el)), el), weight=wt)

# 9
el <- c(150:152)
wt <- c(3,2,1)
g <- g + edges(itlv(rep(9,length(el)), el), weight=wt)

# 10
el <- c(84:106, 148:150, 153, 83, 36)
wt <- rep(1, length(el))
g <- g + edges(itlv(rep(10,length(el)), el), weight=wt)

# 11
el <- c(104:132, 37, 150)
wt <- c(1,1,1, 2, rep(1,15),2,1,2,rep(1,6),2,3, 4)
g <- g + edges(itlv(rep(11,length(el)), el), weight=wt)

# 12
el <- c(130:149, 36)
wt <- c(2, rep(1,7), 2, rep(1,7), 3, rep(1,4))
g <- g + edges(itlv(rep(12,length(el)), el), weight=wt)

# 13
el <- c(20:36, 5, 19, 2, 83)
wt <- c(rep(1,length(20:36)+1),2, 2, 1) 
g <- g + edges(itlv(rep(13,length(el)), el), weight=wt)

# Add attributes
tri <- c(1,3:14)
V(g)[tri]$type1 <- "Characterized pyramidal neuron" # Triangle
cir <- c(15,25:28,36,51:54,67:73,83,93:96,103,105,115:120,140,141,150,163:168,182,183,185,186,191)
V(g)[cir]$type1 <- "Cell body in EM volume" # Circle
square <- setdiff(1:195, c(tri,cir))
V(g)[square]$type1 <- "Dendritic fragment" # square

V(g)[c(15:18,20:28, 38:47, 51:60, 73:82,93:102, 106:109,116:129,133,134,141:149,151,152,154:158,163:176,179,180,183,184,191:194)]$type2 <- "Postsynaptic excitatory target" # magenta
V(g)[c(19, 29:37,48:50,61:72, 83:92,103:105, 110:115,130:132,135:140,150,153,159:162,177,178,181,182,185:190,195 )]$type2 <- "Postsynaptic inhibitory target" # cyan 

g$info <- "Figure 5b"
g$source <-"http://www.nature.com/nature/journal/v471/n7337/full/nature09802.html"
g$sensor <- "Electron microscopy" 
g$DOI <- "doi:10.1038/nature09802"
g$region <- "cerebral cortex"
g$key <- "IT=inhibitory targets, CBEV=cell body in EM volume,"
write.graph(g, "../graphs/mouse_visual.cortex_2.graphml", format="graphml")

