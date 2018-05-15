#Gesamtnetzwerk über die Berichterstattung von #metoo im Zeitraum 16.Oktober 2017 bis 11.März 2018 im Ressort Kultur

# lädt das Paket "igraph"
library(igraph)

# lädt die edgelist aus github 
an <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/Animation_edgelist_metoo_Zeitverlauf.csv", header=TRUE)
is.data.frame(an)
an
ani <- graph.data.frame(an, directed = FALSE)
class(ani)
ani
plot(ani)

# lädt die nodelist aus github
nodes <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/Animation_nodelist_metoo_Zeitverlauf.csv", header=T, as.is=T, sep = ",")

# prüft, ob alle Variablen eingelesen wurden
head(ani)
head(nodes)

# wandelt die edgelist in eine Matrix um und baut das igraph-Objekt
hties <-as.matrix(an)
an <- graph_from_data_frame(d=hties, vertices=nodes, directed=F)

an
plot(an)

# Visualisierung

# Gesamtnetzwerk von #metoo nach vorhandenen Vertex-Attributen darstellen
# Vertex-Attribut "type" definiert: Journalist = 0, Ressort = 1
# Journalisten sollen als Kreis in der Farbe "lightblue" und die Ressorts als Sqaure in der Farbe "maroon" gezeigt werden

V(an)[V(an)$type == 1]$shape <- "square"
V(an)[V(an)$type == 0]$shape <- "circle"
V(an)[V(an)$type == 0]$color <- "lightblue"
V(an)[V(an)$type == 1]$color <- "maroon"

# zeigt uns das Netzwerk nach Vertex-Attributen an
plot(an, layout = layout_with_kk, vertex.label=NA, main="Gesamtnetzwerk #metoo im Ressort Kultur")

# Visualisierung nach den einzelnen Wochen

# Woche 1
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 1 selektiert wird
an1 <- subgraph.edges(an, E(an)[week ==" 1"])
an1
# prüft, ob tatsächlich nur das Attribut für die Woche 1 gezogen wird
edge_attr(an1)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an1, mode = "all")*3

# Vertexattribute festlegen
V(an1)$size = hd
plot (an1, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 1, Ressort Kultur")


# Woche 2
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 2 selektiert wird
an2 <- subgraph.edges(an, E(an)[week ==" 2"])
an2
# prüft, ob tatsächlich nur das Attribut für die Woche 2 gezogen wird
edge_attr(an2)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an2, mode = "all")*3

# Vertexattribute festlegen
V(an2)$size = hd
plot (an2, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 2, Ressort Kultur")


# Woche 3
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 3 selektiert wird
an3 <- subgraph.edges(an, E(an)[week ==" 3"])
an3
# prüft, ob tatsächlich nur das Attribut für die Woche 3 gezogen wird
edge_attr(an3)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an3, mode = "all")*3

# Vertexattribute festlegen
V(an3)$size = hd
plot (an3, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 3, Ressort Kultur")


# Woche 4
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 4 selektiert wird
an4 <- subgraph.edges(an, E(an)[week ==" 4"])
an4
# prüft, ob tatsächlich nur das Attribut für die Woche 4 gezogen wird
edge_attr(an4)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an4, mode = "all")*3

# Vertexattribute festlegen
V(an4)$size = hd
plot (an4, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 4, Ressort Kultur")


# Woche 5
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 5 selektiert wird
an5 <- subgraph.edges(an, E(an)[week ==" 5"])
an5
# prüft, ob tatsächlich nur das Attribut für die Woche 5 gezogen wird
edge_attr(an5)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an5, mode = "all")*3

# Vertexattribute festlegen
V(an5)$size = hd
plot (an5, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 5, Ressort Kultur")


# Woche 6
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 6 selektiert wird
an6 <- subgraph.edges(an, E(an)[week ==" 6"])
an6
# prüft, ob tatsächlich nur das Attribut für die Woche 6 gezogen wird
edge_attr(an6)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an6, mode = "all")*3

# Vertexattribute festlegen
V(an6)$size = hd
plot (an6, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 6, Ressort Kultur")


# Woche 7
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 7 selektiert wird
an7 <- subgraph.edges(an, E(an)[week ==" 7"])
an7
# prüft, ob tatsächlich nur das Attribut für die Woche 7 gezogen wird
edge_attr(an7)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an7, mode = "all")*3

# Vertexattribute festlegen
V(an7)$size = hd
plot (an7, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 7, Ressort Kultur")


# Woche 8
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 8 selektiert wird
an8 <- subgraph.edges(an, E(an)[week ==" 8"])
an8
# prüft, ob tatsächlich nur das Attribut für die Woche 8 gezogen wird
edge_attr(an8)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an8, mode = "all")*3

# Vertexattribute festlegen
V(an8)$size = hd
plot (an8, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 8, Ressort Kultur")


# Woche 9
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 9 selektiert wird
an9 <- subgraph.edges(an, E(an)[week ==" 9"])
an9
# prüft, ob tatsächlich nur das Attribut für die Woche 9 gezogen wird
edge_attr(an9)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an9, mode = "all")*3

# Vertexattribute festlegen
V(an9)$size = hd
plot (an9, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 9, Ressort Kultur")


# Woche 10
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 10 selektiert wird
an10 <- subgraph.edges(an, E(an)[week =="10"])
an10
# prüft, ob tatsächlich nur das Attribut für die Woche 10 gezogen wird
edge_attr(an10)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an10, mode = "all")*3

# Vertexattribute festlegen
V(an10)$size = hd
plot (an10, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 10, Ressort Kultur")


# Woche 11
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 11 selektiert wird
an11 <- subgraph.edges(an, E(an)[week =="11"])
an11
# prüft, ob tatsächlich nur das Attribut für die Woche 11 gezogen wird
edge_attr(an11)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an11, mode = "all")*3

# Vertexattribute festlegen
V(an11)$size = hd
plot (an11, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 11, Ressort Kultur")

# Woche 12
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 12 selektiert wird
an12 <- subgraph.edges(an, E(an)[week =="12"])
an12
# prüft, ob tatsächlich nur das Attribut für die Woche 12 gezogen wird
edge_attr(an12)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an12, mode = "all")*3

# Vertexattribute festlegen
V(an12)$size = hd
plot (an12, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 12, Ressort Kultur")


# Woche 13
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 13 selektiert wird
an13 <- subgraph.edges(an, E(an)[week =="13"])
an13
# prüft, ob tatsächlich nur das Attribut für die Woche 13 gezogen wird
edge_attr(an13)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an13, mode = "all")*3

# Vertexattribute festlegen
V(an13)$size = hd
plot (an13, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 13, Ressort Kultur")


# Woche 14
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 14 selektiert wird
an14 <- subgraph.edges(an, E(an)[week =="14"])
an14
# prüft, ob tatsächlich nur das Attribut für die Woche 14 gezogen wird
edge_attr(an14)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an14, mode = "all")*3

# Vertexattribute festlegen
V(an14)$size = hd
plot (an14, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 14, Ressort Kultur")


# Woche 15
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 15 selektiert wird
an15 <- subgraph.edges(an, E(an)[week =="15"])
an15
# prüft, ob tatsächlich nur das Attribut für die Woche 15 gezogen wird
edge_attr(an15)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an15, mode = "all")*3

# Vertexattribute festlegen
V(an15)$size = hd
plot (an15, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 15, Ressort Kultur")


# Woche 16
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 16 selektiert wird
an16 <- subgraph.edges(an, E(an)[week =="16"])
an16
# prüft, ob tatsächlich nur das Attribut für die Woche 16 gezogen wird
edge_attr(an16)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an16, mode = "all")*3

# Vertexattribute festlegen
V(an16)$size = hd
plot (an16, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 16, Ressort Kultur")


# Woche 17
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 17 selektiert wird
an17 <- subgraph.edges(an, E(an)[week =="17"])
an17
# prüft, ob tatsächlich nur das Attribut für die Woche 17 gezogen wird
edge_attr(an17)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an17, mode = "all")*3

# Vertexattribute festlegen
V(an17)$size = hd
plot (an17, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 17, Ressort Kultur")


# Woche 18
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 18 selektiert wird
an18 <- subgraph.edges(an, E(an)[week =="18"])
an18
# prüft, ob tatsächlich nur das Attribut für die Woche 18 gezogen wird
edge_attr(an18)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an18, mode = "all")*3

# Vertexattribute festlegen
V(an18)$size = hd
plot (an18, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 18, Ressort Kultur")


# Woche 19
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 19 selektiert wird
an19 <- subgraph.edges(an, E(an)[week =="19"])
an19
# prüft, ob tatsächlich nur das Attribut für die Woche 19 gezogen wird
edge_attr(an19)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an19, mode = "all")*3

# Vertexattribute festlegen
V(an19)$size = hd
plot (an19, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 19, Ressort Kultur")


# Woche 20
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 20 selektiert wird
an20 <- subgraph.edges(an, E(an)[week =="20"])
an20
# prüft, ob tatsächlich nur das Attribut für die Woche 20 gezogen wird
edge_attr(an20)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an20, mode = "all")*3

# Vertexattribute festlegen
V(an20)$size = hd
plot (an20, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 20, Ressort Kultur")


# Woche 21
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 1 selektiert wird
an21 <- subgraph.edges(an, E(an)[week =="21"])
an21
# prüft, ob tatsächlich nur das Attribut für die Woche 1 gezogen wird
edge_attr(an21)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an21, mode = "all")*3

# Vertexattribute festlegen
V(an21)$size = hd
plot (an21, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 21, Ressort Kultur")

# Woche 22
# erzeugt ein Teilnetzwerk, in das Edge-Attribut für genau 22 selektiert wird
an22 <- subgraph.edges(an, E(an)[week =="22"])
an22
# prüft, ob tatsächlich nur das Attribut für die Woche 22 gezogen wird
edge_attr(an22)

# zeigt die prozentuale (normalisierte) Verteilung aller degrees an
hd <- degree(an22, mode = "all")*3

# Vertexattribute festlegen
V(an22)$size = hd
plot (an22, edge.curved=.2, layout = layout_with_kk, vertex.frame.color="white", vertex.label=NA, main="#metoo Woche 22, Ressort Kultur")

