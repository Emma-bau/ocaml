open Graph 

(*Définition des paramètres dont nous aurons besoin*)
type flow = int
type capacity = int

(*On veut créer un algorithme de flot donc un graphe de flot*)
type flowgraph = (flow * capacity) graph

(*graph des flow available*)
type available_graph = flow graph

type result = Trouve of ((int list) * int)| Not_Trouve of (int list) (*distinguer les deux cas de sortie de let*)

(*on créer un flowgraph en initialisant les flows à 0 et les capacités au max*)
val init_flow_graph : int graph -> flowgraph

(*On obtient le flow résiduel dans notre graphe*)
val get_flow_available : flowgraph -> available_graph 

(*Trouver le chemin, cette fonction nous renvoie un type result qui contient 
le chemin trouvé et le flot max si un chemin est possible netre la destination et la source
sinon elle nous renvoit la liste des noeuds visités pendant le parcours de l'algortihme*)
val find_path : available_graph-> id -> id -> result 


val update : available_graph -> int -> int list -> available_graph

(*Notre algorithme s'applique sur un graphe de flot*)
val ford_fulkerson : flowgraph -> id -> id -> available_graph

