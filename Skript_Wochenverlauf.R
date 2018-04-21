#Gesamtnetzwerk über die Berichterstattung von #metoo im Zeitraum Oktober 2017 bis Mitte März 2018

# legt die working directory fest
setwd("~/Desktop/metoo")

# lädt das Paket "igraph"
library(igraph)

# lädt die edgelist aus github 
mt <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/edgelist_Gesamt.csv", header=TRUE)
is.data.frame(mt)
mt
mti <- graph.data.frame(mt, directed = FALSE)
class(mti)
mti
plot(mti)

# lädt die Nodelist aus github
nodes <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/nodelist_Gesamt.csv", header=T, as.is=T, sep = ",")

# prüft, ob alle Variablen eingelesen wurden
head(mti)
head(nodes)

# wandelt die edgelist in eine Matrix um und baut das igraph-Objekt
hties <-as.matrix(mt)
mt <- graph_from_data_frame(d=hties, vertices=nodes, directed=F)

mt
plot(mt)

# Gesamtnetzwerk von #metoo nach vorhandenen Vertex-Attributen darstellen
# Vertex-Attribut "type" definiert: Journalist = 0, Ressort = 1
# Journalisten sollen als Kreis und die Resoorts als Viereck gezeigt werden

V(mt)[V(mt)$type == 1]$shape <- "square"
V(mt)[V(mt)$type == 0]$shape <- "circle"

# zeigt uns das Netzwerk nach Formen an
plot(mt, layout = layout_with_fr, vertex.label=NA)

# Die Geschlechter der Journalisten sollen im Gesamtnetzwerk farblich getrennt werden
# Vertex-Attribut "sex" feiniert: female = 1, male = 2, not available = 3 

V(mt)[V(mt)$sex == 1]$color <- "red"
V(mt)[V(mt)$sex == 2]$color <- "lightblue"
V(mt)[V(mt)$sex == 3]$color <- "grey"

# zeigt uns das Netzwerk nach Farben (und Formen) an mit der Überschrift "Gesamtnetzwerk #metoo"
# plot(mt, layout = layout_with_fr, vertex.label=NA, main="Gesamtnetzwerk #metoo")
degree(mt, mode="in", normalized = TRUE)
plot(mt, vertex.size=degree(mt, mode="in")*0.2,  vertex.label = ifelse(degree(mt) > 10, V(mt)$name, NA), layout = layout_with_fr, vertex.label=NA, main="Gesamtnetzwerk #metoo", edge.arrow.size=.1)


# Generierung der wöchentlichen Teilnetzwerke

# zeigt alle Attribute in der edgelist an

mt
list.edge.attributes(mt)

# zeigt das Edge-Attribut "week" an 
edge_attr(mt)

# Woche 1
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 1 selektiert wird
mt1 <- subgraph.edges(mt, E(mt)[week ==" 1"])
mt1
# es gibt nur noch 47 Vertices

# prüft, ob tatsächlich nur das Attribut für die Woche 1 gezogen wird
edge_attr(mt1)

# Knotengröße nach degree verändern und versuchen die Ressorts zu beschriften
degree(mt1, mode="in", normalized = TRUE)
plot(mt1, vertex.size=degree(mt1, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 1", edge.arrow.size=.1)

# Compute node degrees (#links) and use that to set node size:
#deg <- degree(mt1, mode="all")
#V(mt1)$size <- deg*3
#plot(mt1)


# Woche 2
mt
mt2 <- subgraph.edges(mt, E(mt)[week ==" 2"])
mt2
edge_attr(mt2)
plot(mt2, vertex.size=degree(mt2, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 2", edge.arrow.size=.1)


# Woche 3
mt
mt3 <- subgraph.edges(mt, E(mt)[week ==" 3"])
mt3
edge_attr(mt3)
plot(mt3, vertex.size=degree(mt3, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 3", edge.arrow.size=.1)

# Woche 4
mt
mt4 <- subgraph.edges(mt, E(mt)[week ==" 4"])
mt4
edge_attr(mt4)
plot(mt4, vertex.size=degree(mt4, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 4", edge.arrow.size=.1)

# Woche 5
mt
mt5 <- subgraph.edges(mt, E(mt)[week ==" 5"])
mt5
edge_attr(mt5)
plot(mt5, vertex.size=degree(mt5, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 5", edge.arrow.size=.1)

# Woche 6
mt
mt6 <- subgraph.edges(mt, E(mt)[week ==" 6"])
mt6
edge_attr(mt6)
plot(mt6, vertex.size=degree(mt6, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 6", edge.arrow.size=.1)

# Woche 7
mt
mt7 <- subgraph.edges(mt, E(mt)[week ==" 7"])
mt7
edge_attr(mt7)
plot(mt7, vertex.size=degree(mt7, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 7", edge.arrow.size=.1)

# Woche 8
mt
mt8 <- subgraph.edges(mt, E(mt)[week ==" 8"])
mt8
edge_attr(mt8)
plot(mt8, vertex.size=degree(mt8, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 8", edge.arrow.size=.1)

# Woche 9
mt
mt9 <- subgraph.edges(mt, E(mt)[week ==" 9"])
mt9
edge_attr(mt9)
plot(mt9, vertex.size=degree(mt9, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 9", edge.arrow.size=.1)

# Woche 10
mt
mt10 <- subgraph.edges(mt, E(mt)[week =="10"])
mt10
edge_attr(mt10)
plot(mt10, vertex.size=degree(mt10, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 10", edge.arrow.size=.1)

# Woche 11
mt
mt11 <- subgraph.edges(mt, E(mt)[week =="11"])
mt11
edge_attr(mt11)
plot(mt11, vertex.size=degree(mt11, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 11", edge.arrow.size=.1)

# Woche 12
mt
mt12 <- subgraph.edges(mt, E(mt)[week =="12"])
mt12
edge_attr(mt12)
plot(mt12, vertex.size=degree(mt12, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 12", edge.arrow.size=.1)

# Woche 13
mt
mt13 <- subgraph.edges(mt, E(mt)[week =="13"])
mt13
edge_attr(mt13)
plot(mt13, vertex.size=degree(mt13, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 13", edge.arrow.size=.1)

# Woche 14
mt
mt14 <- subgraph.edges(mt, E(mt)[week =="14"])
mt14
edge_attr(mt14)
plot(mt14, vertex.size=degree(mt14, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 14", edge.arrow.size=.1)

# Woche 15
mt
mt15 <- subgraph.edges(mt, E(mt)[week =="15"])
mt15
edge_attr(mt15)
plot(mt15, vertex.size=degree(mt15, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 15", edge.arrow.size=.1)

# Woche 16
mt
mt16 <- subgraph.edges(mt, E(mt)[week =="16"])
mt16
edge_attr(mt16)
plot(mt16, vertex.size=degree(mt16, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 16", edge.arrow.size=.1)

# Woche 17
mt
mt17 <- subgraph.edges(mt, E(mt)[week =="17"])
mt17
edge_attr(mt17)
plot(mt17, vertex.size=degree(mt17, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 17", edge.arrow.size=.1)

# Woche 18
mt
mt18 <- subgraph.edges(mt, E(mt)[week =="18"])
mt18
edge_attr(mt18)
plot(mt18, vertex.size=degree(mt18, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 18", edge.arrow.size=.1)

# Woche 19
mt
mt19 <- subgraph.edges(mt, E(mt)[week =="19"])
mt19
edge_attr(mt19)
plot(mt19, vertex.size=degree(mt19, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 19", edge.arrow.size=.1)

# Woche 20
mt
mt20 <- subgraph.edges(mt, E(mt)[week =="20"])
mt20
edge_attr(mt20)
plot(mt20, vertex.size=degree(mt20, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 20", edge.arrow.size=.1)

# Woche 21
mt
mt21 <- subgraph.edges(mt, E(mt)[week =="21"])
mt21
edge_attr(mt21)
plot(mt21, vertex.size=degree(mt21, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 21", edge.arrow.size=.1)

# Woche 22
mt
mt22 <- subgraph.edges(mt, E(mt)[week =="22"])
mt22
edge_attr(mt22)
plot(mt22, vertex.size=degree(mt22, mode="in")*3, layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 22", edge.arrow.size=.1)
