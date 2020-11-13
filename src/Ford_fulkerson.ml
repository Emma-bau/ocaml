open Graph
open Tools

(*Définition des paramètres dont nous aurons besoin*)
type flow = int
type capacity = int
type edge = flow * capacity

(*On veut créer un algorithme de flot donc un graphe de flot*)
type flowgraph = edge graph

(*direction des flèches dans notre graphe*)
type direction= Same | Opposite

(*graph des flow available*)
type available_graph=(flow*direction) graph

(*On créer tout d'abord notre graphe avec le flow encore disponible sur chaque arc*)
let get_flow_available gr = 
  let gr_clone = clone_nodes gr in 
  e_fold gr (fun available_graph id1 id2 (flow,capacity) ->
  if capacity=0 then
    available_graph
  else
    if flow <> 0 && flow <> capacity then
    (*Construction des deux flèches, l'une dans un sens Same l'autre en Opposite*)
      let new_available_graph = new_arc available_graph id1 id2 (capacity-flow,Same) in
      new_arc new_available_graph id2 id1 (flow,Opposite)
    else if flow = 0 then 
      new_arc available_graph id1 id2(capacity,Same)
    else
      new_arc available_graph id1 id2(capacity, Opposite)
  )
  gr_clone


  let init_flow_graph gr =
    let gr_clone = clone_nodes gr in
    e_fold gr (fun flow_graph id1 id2 lbl-> 
      new_arc flow_graph id1 id2 (0, lbl)) 
    gr_clone



