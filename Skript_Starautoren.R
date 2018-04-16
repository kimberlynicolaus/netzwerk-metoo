#Gesamtnetzwerk der Starautoren

# lädt das Paket "igraph"
library(igraph)

# lädt die edgelist aus github 
sa <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/edgelist_Starautoren.csv", header=TRUE)
is.data.frame(sa)
sa
sai <- graph.data.frame(sa, directed = TRUE)
class(sai)
sai
plot(sai)

# lädt die Nodelist aus github
nodes <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/nodelist_Starautoren.csv", header=T, as.is=T, sep = ",")

# prüft, ob alle Variablen eingelesen wurden
head(sai)
head(nodes)

# wandelt die edgelist in eine Matrix um und baut das igraph-Objekt
hties <-as.matrix(sa)
sa <- graph_from_data_frame(d=hties, vertices=nodes, directed=T)

sa
plot(sa)

# zeigt die Verteilung der Vertex-Attribute an
vertex_attr(sa)

#Anwendung der Netzwerkmaße

# 1 Komponent in der Größe 86 (Starautoren und Twitterfollower) 
components(sa) 

# Ein Komponent hängt logischerweise zusammen
is_connected(sa) 

# Welchen Durchmesser hat das Netzwerk?
diameter(sa) 

# Wie ist die Dichte des Netzwerks?
edge_density(sa) # 2,5 Prozent von 85 möglichen Beziehungen realisiert

# durchschnittliche Pfaddistanz, Ergebnis: 2.357 
# im Schnitt braucht man 2.357 Schritte um von einem zum anderen Knoten zu kommen
mean_distance(sa)  

# Wie viele Cluster hat das Netzwerk?
cluster_walktrap(sa)
sac <- cluster_walktrap(sa) 
# Welche Cluster hängen eng zusammen? Welche Knoten hängen eng zusammen? 
modularity(sac) 
membership(sac)
plot(sac, sa, edge.arrow.size=.2)

# Anwendung der Akteursmaße

# Degree (in/out) als Zentralitätsmaß berechnen
# Das indegree-Maß beschreibt die Anzahl der eingehenden edges eines Knoten
# Bei marga_owski ist der höchste indegree von 84, bei missclaraott 9 und bei annalero 6
degree(sa, mode = "in")

# Das outdegree-Maß beschreibt die Anzahl der abgehenden edges eines Knoten
# Bei marga_owski ist der höchste outdegree von 60, bei missclaraott 25 und bei annalero 4
degree(sa, mode = "out")

#plot(sa, vertex.size=degree(sa, mode="in")*2, edge.arrow.size=.2)
# visualisiert das Netzwerk anhand der indegrees

# zeigt die prozentuale (normalisierte) Verteilung aller indegrees im Netzwerk an
degree(sa, mode="in", normalized = TRUE)

#Zentralisierter Degree-Wert
centr_degree(sa)$centralization

#Zentralisierter Closeness-Wert
centr_clo(sa, mode = "all")$centralization

#Zentralisierter Betweenness-Wert
centr_betw(sa, directed = TRUE)$centralization

#Zentralisierter Eigenvector-Wert
centr_eigen(sa, directed = TRUE)$centralization

# Betweenness (Maß für die Brokerage von Knoten im Netzwerk)
# Ergebnis: marga_owski 6094.5, missclaraott 1325.5, annalero 161.0
betweenness(sa)
edge_betweenness(sa)

# Visualisierung 

# Gesamtnetzwerk der Starautoren nach vorhandenen Vertex-Attributen darstellen
# Vertex-Attribut "type" definiert: Follower = 0, Starautor = 1
# Follower sollen als Kreis und die Starautoren als Viereck gezeigt werden

V(sa)[V(sa)$type == 1]$shape <- "square"
V(sa)[V(sa)$type == 0]$shape <- "circle"
plot(sa)

# zeigt uns das Netzwerk ohne Beschriftung an
plot(sa, layout = layout_with_fr, vertex.label=NA)

# zeigt uns das Netzwerk mit Beschriftung der Starautoren an
degree(sa, mode="in", normalized = TRUE)
plot(sa, vertex.size=degree(sa, mode="in")*0.2, vertex.label = ifelse(degree(sa) > 4, V(sa)$name, NA), layout = layout_with_fr, vertex.label=NA, main="Gesamtnetzwerk Starautoren", edge.arrow.size=.1)

# In Cluster visualisieren
plot(sac, sa, vertex.size=degree(sa, mode="in")*0.2, vertex.label = ifelse(degree(sa) > 4, V(sa)$name, NA), layout = layout_with_fr, vertex.label=NA, main="Gesamtnetzwerk Starautoren", edge.arrow.size=.2)


# Egonetzwerke der Starautoren selektieren

vmarga_owski <- subgraph <- make_ego_graph(sa, order=1, c("marga_owski"))
plot(vmarga_owski[[1]], edge.arrow.size = 1)

vmissclaraott <- subgraph <- make_ego_graph(sa, order=1, c("missclaraott"))
plot(vmissclaraott[[1]], edge.arrow.size = 1)

vannalero <- subgraph <- make_ego_graph(sa, order=1, c("annalero"))
plot(vannalero[[1]], edge.arrow.size = 1)
