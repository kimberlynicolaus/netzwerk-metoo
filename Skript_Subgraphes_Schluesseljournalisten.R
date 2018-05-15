#Ego-Netzwerke der Schlüsseljournalisten

# lädt das Paket "igraph"
library(igraph)

# lädt die edgelist aus github 
su <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/Edgelist_Twitter_Schluesseljournalisten.csv", header=TRUE)
is.data.frame(su)
su
sui <- graph.data.frame(su, directed = TRUE)
class(sui)
sui
plot(sui)

# lädt die nodelist aus github
nodes <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/Nodelist_Subgraphes_Twitter_Schluesseljournalisten.csv", header=T, as.is=T, sep = ",")

# prüft, ob alle Variablen eingelesen wurden
head(sui)
head(nodes)

# wandelt die edgelist in eine Matrix um und baut das igraph-Objekt
hties <-as.matrix(su)
su <- graph_from_data_frame(d=hties, vertices=nodes, directed=T)

su
plot(su)

# Visualisierung 

# Ego-Netzwerke der Schlüsseljournalisten nach vorhandenen Vertex-Attributen darstellen
# Vertex-Attribut "type" definiert: Journalist (Twitteraccount) = 0, Schlüsseljournalist (Twitteraccount) = 1
# Journalisten sollen als Kreis und in der Farbe lightblue die Schlüsseljournalisten als Square in der Farbe maroon gezeigt werden

V(su)[V(su)$type == 1]$shape <- "square"
V(su)[V(su)$type == 0]$shape <- "circle"
V(su)[V(su)$type == 0]$color <- "lightblue"
V(su)[V(su)$type == 1]$color <- "maroon"

# zeigt Gesamtnetzwerk der Schlüsseljournalisten und deren feministisches Twitter-Netzwerk nach Vertex-Attributen an
plot(su)

# generiert Subgraphes der jeweiligen Ego-Netzwerke von den Schlüsseljournalisten

vmarga_owski <- subgraph <- make_ego_graph(su, order=1, c("marga_owski"))
plot(vmarga_owski[[1]], edge.arrow.size = .2, vertex.label = NA, vertex.frame.color="white", layout = layout_with_kk, main = "Ego-Netzwerk von Margarete Stokowski")

vmissclaraott <- subgraph <- make_ego_graph(su, order=1, c("missclaraott"))
plot(vmissclaraott[[1]], edge.arrow.size = .2, vertex.label = NA, vertex.frame.color="white", layout = layout_with_kk, main = "Ego-Netzwerk von Clara Ott")

vannalero <- subgraph <- make_ego_graph(su, order=1, c("annalero"))
plot(vannalero[[1]], edge.arrow.size = .2, vertex.label = NA, vertex.frame.color="white", layout = layout_with_kk, main = "Ego-Netzwerk von Anna-Lena Roth")
