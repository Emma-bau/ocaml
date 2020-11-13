open Graph
open Tools

(*Définition des paramètres dont nous aurons besoin*)
type flow = int
type capacity = int
type edge =(flow*capacity)

(*On veut créer un algorithme de flot donc un graphe de flot*)
type flowgraph =  edge graph

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


  (*let init_flow_graph gr =
    let gr_clone = clone_nodes gr in
    e_fold gr (fun flow_graph id1 id2 lbl-> 
      new_arc flow_graph id1 id2 (0, lbl)) 
    gr_clone*)


  (*Création d'une interruption pour notre loop, lorque notre chemin est trouvé. On a besoin de récupérer notre chemin et le cout min que l'on peut ajouter par branche "Goulot d'étranglement"*)
exception  Path_Found of (((id * direction) list) * int)

let rec find_path gr source dest = 
  let rec loop_on_edge acu long visited  = function
    |[] -> visited(*Tous les noeuds sont testés, la source n'a pas été trouvée*)
    |(id,(available_flow,direction))::rest->
      if id = dest then
        let long = if available_flow < long then available_flow else long in
        raise (Path_Found (List.rev ((dest, direction)::acu), long))
      else if List.mem id visited then
        loop_on_edge acu long visited rest
      (*On analyse le reste de notre liste*)
      else
        (*On met à jour notre visited*)
        let new_visited = loop_on_edge  acu long  (id::visited) rest in
        (*poblème de flot, on réduit le flot max, on loop sur ce nouveau noeud et sur les arcs qui en proviennent*)
        if available_flow < long then 
          loop_on_edge ((id, direction)::acu) available_flow new_visited  (out_arcs gr id)
        (*Sinon il n'y aura pas de problème de flot, on continue*)
        else 
        loop_on_edge ((id, direction)::acu) long new_visited  (out_arcs gr id)
  in
  loop_on_edge  [(source,Same)] max_int [source] (out_arcs gr source)




(*Grace à notre exception on récupère donc le chemin le plus court de notre source 
à notre destination ainsi que son flot max*)


(*algorithme de ford fulkerson*)




