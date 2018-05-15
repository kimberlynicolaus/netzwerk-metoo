#Gesamtnetzwerk über die Berichterstattung von #metoo im Zeitraum 16.Oktober 2017 bis 11.März 2018

# lädt das Paket "igraph"
library(igraph)

# lädt die edgelist aus github 
mm <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/edgelist_Gesamt.csv", header=TRUE)
is.data.frame(mm)
mm
mmi <- graph.data.frame(mm, directed = FALSE)
class(mmi)
mmi
plot(mmi)

# lädt die nodelist aus github
nodes <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/nodelist_Gesamt.csv", header=T, as.is=T, sep = ",")

# prüft, ob alle Variablen eingelesen wurden
head(mmi)
head(nodes)

# wandelt die edgelist in eine Matrix um und baut das igraph-Objekt
hties <-as.matrix(mm)
mm <- graph_from_data_frame(d=hties, vertices=nodes, directed=F)

mm
plot(mm)

# Visualisierung

# Gesamtnetzwerk von #metoo nach vorhandenen Vertex-Attributen darstellen
# Vertex-Attribut "type" definiert: Journalist = 0, Ressort = 1
# Journalisten sollen als Kreis in der Farbe "lightblue" und die Ressorts als Sqaure in der Farbe "maroon" gezeigt werden

V(mm)[V(an)$type == 1]$shape <- "square"
V(mm)[V(an)$type == 0]$shape <- "circle"
V(mm)[V(an)$type == 0]$color <- "lightblue"
V(mm)[V(an)$type == 1]$color <- "maroon"


# Gesamtnetzwerk von #metoo anzeigen 
plot(mm,vertex.label.cex=0.8, vertex.label.color="black", vertex.label.family="Helvetica", vertex.frame.color="white", vertex.size=degree(mm, mode="in")*0.2,  vertex.label = ifelse(degree(mm) > 10, V(mm)$name, NA), layout = layout_with_fr, vertex.label=NA, main="Gesamtnetzwerk #metoo", edge.arrow.size=.1)

