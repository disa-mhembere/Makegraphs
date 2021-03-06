# mc.R
# Created by Disa Mhembere on 2014-03-10.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

require(igraph)                                                                                                  
mec <- read.table("../data/matrix_electrical_2014_01_17_15_40_34.csv", sep=",", encoding="latin1", header=TRUE)        
mec[is.na(mec)] <- 0                                                                                             
gmec <- graph.adjacency(as.matrix(mec), weighted=TRUE)                                                           
                                                                                                                 
V(gmec)$name <- c("gonad","ailL","ailR","vBWMR19","vBWML17","dBWML24","vBWMR24","vBWML20","vspR","dglL6","vBWML19","dspR","dglR7","vBWML23","dBWMR24","grtL","dglL7","pobR","vBWMR20","vsrR","dsrR","pilL","dglL4","grtR","dsrL","pilR","polL","dglR4","dspL","vsrL","dglR8","dglR2","dglL2","dglR3","dglL1","gecL","vBWML21","aobL","dglL5","pobL","dBWMR22","dglR6","vspL","[vBWML22]","[vBWML21]","[vBWML19]","cdlR","[vBWMR19]","cdlL","[dglR1]","sph","vBWMR21","[sph]","[dglR2]","[vBWMR24]","[vBWML20]","[vBWMR22]","[intL]","adp","[vBWML17]","[vBWMR18]","dglR5","[dglR3]","[dBWMR23]","[dBWML21]","[vBWMR21]","dBWMR23","aobR","vBWML22","[vBWML23]","[dBWML23]","[dBWML22]","intL","dBWML23","intR","vBWMR23","[vBWMR20]","dglL3","[dglR4]","vBWMR22","[dBWMR21]","[vBWMR23]","gecR","dglR1","polR","dBWML22","[dBWMR22]","[dBWML24]","[dBWMR24]","EF2","PDB","PVZ","AVG","EF1","PVV","VA11","PVCR","PVCL","PVQL","AVKR","AN1b","CA06","AVKL","PVX","DVA","VB09","AN1a","[CA04]","VB10","DVE","AVAL","PVS","VA12","VB06","PVY","AVDR","AVAR","CA05","PVU","AVDL","SPDL","VA10","VB08","PDEL","DVF","R1BR","VB11","PVNL","HOA","SPVL","AVBL","AS11","HOB","CA09","SPVR","PVQR","PQR","PVWL","PVWR","PDER","CP07","R7BR","AN3b","PDC","SPDR","LUAL","EF3","R9BL","VB07","AVBR","PCAL","LUAR","DA09","AN3a","AN2b","PCBL","CP08","[CP04]","PVDL","[CP03]","AN2a","DB06","SPCL","DB05","[PVX]","CP09","DVC","[PVQR]","[PVNL]","[CP02]","PCAR","[AVL]","R9AR","DD06","VA09","DA07","PCBR","SPCR","PCCL","PVM","R9AL","R9BR","[CP01]","R8AL","CP05","PHAR","DX3","PHAL","[DB04]","R8AR","CA07","R6BR","PCCR","R3BR","PHCR","PHBL","PVDR","[R7BL]","PHCL","PDA","PLML","DD05","CA08","DA06","PGA","[PVDR]","PLMR","DB07","R7AR","R4BR","PVT","R4AR","[DB03]","R1AR","R8BR","R5BR","R8BL","[CA03]","DX1","R2AL","R6AR","R3BL","VD13","[DA05]","R2BL","R4AL","R3AL","R7BL","CP06","R2AR","R6AL","R3AR","R2BR","DA08","[R4AL]","R5AR","VD10","VD12","VD11","ALNR","DX2","[CA08]","[VB05]","R7AL","[PVDL]","R1AL","PLNR","VD09","R4BL","DD04","[CA02]","[DD03]","AS10","[PVV]","R6BL","PLNL","PVR","R5AL","ALNL","[DVA]","R5BL","[DA04]","[VA08]","PVNR","R1BL","[PVCR]","AS09","AS08","[PVWL]","DVB","hyp","PHBR")

E(gmec)$electrical_weight <- E(gmec)$weight
gmec <- remove.edge.attribute(gmec, "weight")

mcc <- read.table("../data/matrix_chemical_2014_01_17_15_42_06.csv", sep=",", encoding="latin1", header=TRUE)
mcc[is.na(mcc)] <- 0
gmcc <- graph.adjacency(as.matrix(mcc), weighted=TRUE)
V(gmcc)$name <- c("gonad","ailL","ailR","vBWMR19","vBWML17","dBWML24","vBWMR24","vBWML20","vspR","dglL6","vBWML19","dspR","dglR7","vBWML23","dBWMR24","grtL","dglL7","pobR","vBWMR20","vsrR","dsrR","pilL","dglL4","grtR","dsrL","pilR","polL","dglR4","dspL","vsrL","dglR8","dglR2","dglL2","dglR3","dglL1","gecL","vBWML21","aobL","dglL5","pobL","dBWMR22","dglR6","vspL","[vBWML22]","[vBWML21]","[vBWML19]","cdlR","[vBWMR19]","cdlL","[dglR1]","sph","vBWMR21","[sph]","[dglR2]","[vBWMR24]","[vBWML20]","[vBWMR22]","[intL]","adp","[vBWML17]","[vBWMR18]","dglR5","[dglR3]","[dBWMR23]","[dBWML21]","[vBWMR21]","dBWMR23","aobR","vBWML22","[vBWML23]","[dBWML23]","[dBWML22]","intL","dBWML23","intR","vBWMR23","[vBWMR20]","dglL3","[dglR4]","vBWMR22","[dBWMR21]","[vBWMR23]","gecR","dglR1","polR","dBWML22","[dBWMR22]","[dBWML24]","[dBWMR24]","EF2","PDB","PVZ","AVG","EF1","PVV","VA11","PVCR","PVCL","PVQL","AVKR","AN1b","CA06","AVKL","PVX","DVA","VB09","AN1a","[CA04]","VB10","DVE","AVAL","PVS","VA12","VB06","PVY","AVDR","AVAR","CA05","PVU","AVDL","SPDL","VA10","VB08","PDEL","DVF","R1BR","VB11","PVNL","HOA","SPVL","AVBL","AS11","HOB","CA09","SPVR","PVQR","PQR","PVWL","PVWR","PDER","CP07","R7BR","AN3b","PDC","SPDR","LUAL","EF3","R9BL","VB07","AVBR","PCAL","LUAR","DA09","AN3a","AN2b","PCBL","CP08","[CP04]","PVDL","[CP03]","AN2a","DB06","SPCL","DB05","[PVX]","CP09","DVC","[PVQR]","[PVNL]","[CP02]","PCAR","[AVL]","R9AR","DD06","VA09","DA07","PCBR","SPCR","PCCL","PVM","R9AL","R9BR","[CP01]","R8AL","CP05","PHAR","DX3","PHAL","[DB04]","R8AR","CA07","R6BR","PCCR","R3BR","PHCR","PHBL","PVDR","[R7BL]","PHCL","PDA","PLML","DD05","CA08","DA06","PGA","[PVDR]","PLMR","DB07","R7AR","R4BR","PVT","R4AR","[DB03]","R1AR","R8BR","R5BR","R8BL","[CA03]","DX1","R2AL","R6AR","R3BL","VD13","[DA05]","R2BL","R4AL","R3AL","R7BL","CP06","R2AR","R6AL","R3AR","R2BR","DA08","[R4AL]","R5AR","VD10","VD12","VD11","ALNR","DX2","[CA08]","[VB05]","R7AL","[PVDL]","R1AL","PLNR","VD09","R4BL","DD04","[CA02]","[DD03]","AS10","[PVV]","R6BL","PLNL","PVR","R5AL","ALNL","[DVA]","R5BL","[DA04]","[VA08]","PVNR","R1BL","[PVCR]","AS09","AS08","[PVWL]","DVB","hyp","PHBR")

E(gmcc)$chemical_weight <- E(gmcc)$weight
gmcc <- remove.edge.attribute(gmcc, "weight")

g <- graph.union(gmcc, gmec) # Need to merge vertices but not edges
g$source <- "http://www.sciencemag.org/content/337/6093/437.full"
g$DOI <- "10.1126/science.1221762"
g$region <- "neural"
g$sensor <- "Electron Microscopy"
write.graph(g, "../graphs/c.elegans_neural.male_1.graphml", format="graphml")
