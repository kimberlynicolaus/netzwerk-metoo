#Gesamtnetzwerk der Schlüsseljournalisten und deren feministisches Twitter-Netzwerk

# lädt das Paket "igraph"
library(igraph)

# lädt die edgelist aus github 
sa <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/Edgelist_Twitter_Schluesseljournalisten.csv", header=TRUE)
is.data.frame(sa)
# lädt die nodelist aus github
nodes <- read.csv("https://raw.githubusercontent.com/kimberlynicolaus/netzwerk-metoo/master/Nodelist_Twitter_Schluesseljournalisten.csv", header=T, as.is=T, sep = ",")
is.data.frame(nodes)
# prüft, ob alle Variablen eingelesen wurden
head(sa)
head(nodes)

# wandelt die edgelist in eine Matrix um und baut das igraph-Objekt
hties <-as.matrix(sa)
sa <- graph_from_data_frame(d=hties, vertices=nodes, directed=T)
class(sa)
sa
plot(sa)

# zeigt die Verteilung der Vertex-Attribute an
vertex_attr(sa)


#Anwendung der Netzwerkmaße

# 1 Komponent in der Größe 30 (Schlüsseljournalisten und Twitterfollower) 
components(sa) 

# Ein Komponent hängt logischerweise zusammen
is_connected(sa) 

# Der Durchmesser des Netzwerks beträgt 4
diameter(sa) 

# Wie ist die Dichte des Netzwerks?
# 32 Prozent von 870 möglichen Beziehungen sind realisiert, also: 278 Beziehungen
edge_density(sa) 

# Die durchschnittliche Pfaddistanz beträgt 1.863258
mean_distance(sa)  

# Die Reziprozität der Kanten beträgt ca. 49,46 Prozent
reciprocity(sa, ignore.loops = TRUE, mode = c("default", "ratio"))

# Das Netzwerk hat 3 Cluster
cluster_walktrap(sa)
sac <- cluster_walktrap(sa) 
# Zeigt an, welche Knoten zu welchem Cluster gehören
membership(sac)
# Zeigt das Netzwerk in Clustern an
plot(sac, sa, edge.arrow.size=.2)


# Anwendung der Akteursmaße

# Das indegree-Maß beschreibt die Anzahl der eingehenden edges eines Knotens 
# Bei marga_owski ist der höchste indegree von 29, bei missclaraott 9 und bei annalero 6
degree(sa, mode = "in")

# Das outdegree-Maß beschreibt die Anzahl der ausgehenden edges eines Knotens
# Bei marga_owski beträgt der outdegree 8, bei missclaraott 25 und bei annalero 3
degree(sa, mode = "out")

# zeigt die prozentuale (normalisierte) Verteilung aller indegrees im Netzwerk an
degree(sa, mode="in", normalized = TRUE)

# zeigt die prozentuale (normalisierte) Verteilung aller outdegrees im Netzwerk an
degree(sa, mode="out", normalized = TRUE)

#Zentralisierter Degree-Wert
centr_degree(sa)$centralization

#Zentralisierter Closeness-Wert
centr_clo(sa, mode = "all")$centralization

#Zentralisierter Betweenness-Wert
centr_betw(sa, directed = TRUE)$centralization

#Zentralisierter Eigenvector-Wert
centr_eigen(sa, directed = TRUE)$centralization

# Betweenness (Maß für die Brokerage von Knoten im Netzwerk)
# Werte der Schlüsseljournalisten: marga_owski 53.5607683, missclaraott 187.5675355, annalero 1.6584641
betweenness(sa)


# Visualisierung 

# Gesamtnetzwerk der Schlüsseljournalisten und deren feministisches Twitter-Netzwerk nach vorhandenen Vertex-Attributen darstellen
# Vertex-Attribut "type" definiert: Medium (Twitteraccount) = 0, Follower (Twitteraccount) = 1
# Follower sollen als Kreis und die Medien als Square gezeigt werden

V(sa)[V(sa)$type == 1]$shape <- "square"
V(sa)[V(sa)$type == 0]$shape <- "circle"
plot(sa)

# zeigt uns das Netzwerk ohne Beschriftung an
plot(sa, layout = layout_with_fr, vertex.label=NA)

# In Cluster visualisieren
plot(sac, sa, vertex.size=degree(sa, mode="in")*0.2, layout = layout_with_fr, main="Gesamtnetzwerk Starautoren", edge.arrow.size=.2)

#Anzahl und Form der Dyaden
dyad_census(sa)

#Anzahl der Triaden-Typen
triad_census(sa)

# Visualisierungsparameter 

# Kantenattribute festlegen
E(sa)$arrow.size <- .2
E(sa)$color="grey"
E(sa)$curved=.2

# Visualisierung nach degrees in Abstufung von darkblue bis maroon
hd <- degree(sa, mode = "all")
fine = 4
palette = colorRampPalette(c("darkblue","lightblue","maroon"))
ired = palette(fine)[as.numeric(cut(hd, breaks = fine))]

# Vertexattribute festlegen
V(sa)$size = hd
V(sa)$color = ired
V(sa)$shape <- "square"
plot (sa, layout = layout_with_kk)


# Plot mit Titel und Untertitel
plot(sa, layout = layout_with_kk, main="Schlüsseljournalisten in feministischen Twitter-Netzwerk")

#  Visualisierung mit VisNetwork 
library(visNetwork)
?visNetwork

# Favorisierte Layout-Ausgabe
visIgraph (sa, layout = "layout_with_kk")

# Visualsierungen, die nicht genutzt wurden

# Weitere Layoutmöglichkeiten
visIgraph(sa, layout = "layout_in_circle")
visIgraph(sa, layout = "layout_with_fr")
visIgraph(sa, layout = "layout_nicely")

# Visualisierungsmöglichkeit nach Wohnorten 
V(sa)[V(sa)$wohnort == 1]$color <- "red"
V(sa)[V(sa)$wohnort == 2]$color <- "blue"
V(sa)[V(sa)$wohnort == 3]$color <- "green"
V(sa)[V(sa)$wohnort == 4]$color <- "yellow"
V(sa)[V(sa)$wohnort == 5]$color <- "orange"
V(sa)[V(sa)$wohnort == 6]$color <- "pink"
plot(sa)
