open Graph 

(*Définition des paramètres dont nous aurons besoin*)
type flow = int
type capacity = int

(*On veut créer un algorithme de flot donc un graphe de flot*)
type flowgraph = (flow * capacity) graph


(*direction des flèches dans notre graphe*)
type direction= Same | Opposite
(*graph des flow available*)
type available_graph = (flow*direction) graph

(*Notre algorithme s'applique sur un graphe de flot*)
(*val ford_fulkerson: flowgraph-> id-> id->flowgraph*)
val get_flow_available : flowgraph -> available_graph

(*val init_flow_graph : 'a graph -> flowgraph*)