#!/usr/bin/python

# rhesus.py
# Created by Disa Mhembere on 2014-03-12.
# Email: disa@jhu.edu
# Copyright (c) 2014. All rights reserved.
import scipy.io as sio
import igraph

def main():
  m = sio.loadmat("../data/rhesus_brain_cocomac.mat")["MacCrtx"]
  g = igraph.Graph.Adjacency(m.tolist())

  # get vertex names
  name_file = open("../data/vertex_names.txt", "rb")
  names = []

  name = name_file.readline().strip()
  while (name):
    names.append(name)
    name = name_file.readline().strip()
  
  g.vs["name"] = names
  g["source"] = "http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0046497#s5"
  g["sensor"] = "Tract tracing studies"
  g["DOI"] = "10.1371/journal.pone.0046497"
  g["region"] = "Cerebral Cortex"

  g.write_graphml("../graphs/rhesus_brain_1.graphml")
  
if __name__ == "__main__":
  main()
