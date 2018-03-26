# netzwerk-metoo

library(igraph)
mt <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/edgelist_kim.csv", header=TRUE)
is.data.frame(mt)
mt
mti <- graph.data.frame(mt, directed = FALSE)
class(mti)
mti
plot(mti)

nodes <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/nodelist_kim.csv", header=T, as.is=T, sep = ",")

# prüft, ob alle Variablen eingelesen wurden
head(mti)
head(nodes)

# wandelt die edgelist in eine Matrix um und baut das igraph-Objekt
hties <-as.matrix(mt)
mt <- graph_from_data_frame(d=hties, vertices=nodes, directed=F)

mt
plot(mt)

V(mt)$label <- NA # überschreibt alle Labels mit dem Wert "NA", der nicht angezeigt wird.
plot(mt)

list.edge.attributes(mt)
subgraph.edges(mt)
E(mti)[week == 1]
mt1 <- subgraph.edges(mti, E(mti)[week ==1])
plot(mt1)

V(mt1)$label <- NA # überschreibt alle Labels mit dem Wert "NA", der nicht angezeigt wird.
plot(mt1)

colrs <- c("pink","blue", "yellow")
V(mt1)$color<- colrs[V(mt)$sex]
plot(mt1)

# Labels wiederherstellen
V(mt1)$label <- V(mt)$name # weist dem Vertex-Attribut "label" wieder das Vertex-Attribut "name" zu.
plot(mt1)

degree(mt1, mode = "in")
#degree(mt1, mode="in", normalized = TRUE)

#V(mt1)$label <- V(mt)$name # weist dem Vertex-Attribut "label" wieder das Vertex-Attribut "name" zu.

ressorts <- V(mt)[type == "1"]
# wöhlt alle Knoten aus, die das Vertex-Attribut "1" bei $type gesetzt haben

ressorts

V(mt)[ressorts]$shape = "square"
# weist allen Werten von Smokers den Shape "square" zu.

V(mt)[V(mt)$type == 1]$shape <- "square"
V(mt)[V(mt)$type == 0]$shape <- "circle"
plot(mt1)

plot(mt1, vertex.size=degree(mt1, mode="in")*3, edge.arrow.size=.2)

