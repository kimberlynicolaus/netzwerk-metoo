#Beschriftung der Ressorts für Woche 1

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
plot(mt, layout = layout_with_fr, vertex.label=NA, main="Gesamtnetzwerk #metoo")

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
plot(mt1, vertex.size=degree(mt1, mode="in")*3,  vertex.label = ifelse(degree(mt1) > 1, V(mt1)$name, NA), layout = layout_with_fr, vertex.label=NA, main="#metoo Woche 1", edge.arrow.size=.1)
