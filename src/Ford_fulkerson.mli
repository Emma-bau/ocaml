open Graph 

(*Définition des paramètres dont nous aurons besoin*)
type flow = int
type capacity = int

(*On veut créer un algorithme de flot donc un graphe de flot*)
type flowgraph = (flow * capacity) graph


(*direction des flèches dans notre graphe*)
type direction= Same | Opposite
(*graph des flow available*)
type available_graph = flow graph

type result = Trouve of ((int list) * int)| Not_Trouve of (int list) (*distinguer les deux cas de sortie de let*)

val find_path : available_graph-> id -> id -> result 

(*Notre algorithme s'applique sur un graphe de flot*)
(*val ford_fulkerson: flowgraph-> id-> id->flowgraph*)
(*val ford_fulkerson : flowgraph -> id -> id -> flowgraph*)

(*val init_flow_graph : 'a graph -> flowgraph*)