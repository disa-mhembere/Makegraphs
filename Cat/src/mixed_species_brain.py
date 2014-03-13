#!/usr/bin/python

# mixed_species_brain.py
# Created by Disa Mhembere on 2014-03-13.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.

import scipy.io as sio
import igraph

def main():
  m = sio.loadmat("../data/CatCM.mat")["CatConnectome"]
  g = igraph.Graph.Adjacency(m.tolist())

  g["source"] = "http://www.jneurosci.org/content/33/32/12929.full"
  g["sensor"] = "Tract tracing studies"
  g["DOI"] = "10.1523/JNEUROSCI.1448-13.2013"
  g["region"] = "brain"

  g.write_graphml("../graphs/mixed.species_brain_1.graphml")
  
if __name__ == "__main__":
  main()
