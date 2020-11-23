open Graph
open Tools

(*Définition des paramètres dont nous aurons besoin*)
type flow = int
type capacity = int

(*On veut créer un algorithme de flot donc un graphe de flot*)
type flowgraph = (flow*capacity) graph

(*graph des flow available*)
type available_graph = flow graph

(*On créer tout d'abord notre graphe avec le flow encore disponible sur chaque arc*)
let get_flow_available gr = 
  let gr_clone = clone_nodes gr in 
  e_fold gr (fun available_graph id1 id2 (flow,capacity) ->
  if capacity=0 then
    available_graph
  else
    if flow <> 0 && flow <> capacity then
      let new_available_graph = new_arc available_graph id1 id2 (capacity-flow) in
      new_arc new_available_graph id2 id1 (flow)
    else if flow = 0 then 
      new_arc available_graph id1 id2 (capacity)
    else
      new_arc available_graph id1 id2 (capacity)
  )
  gr_clone


   (*On considère que notre graph sera toujours composé d'entier*)
  let init_flow_graph (gr:int graph) =
    let gr_clone = clone_nodes gr in
    e_fold gr (fun flow_graph id1 id2 (lbl:int)-> 
      new_arc flow_graph id1 id2 (0, lbl)) 
    gr_clone 

    (*Enlever direction pour l'instant*)
    (*vérifier si le avaible floxw est potisitf *)
    (*capacité de 0 non pris à rajouter*)
    (*renvoyer le chemin, si la liste est vide, on n'a pas trouvé*)
  type result = Trouve of ((int list) * int)| Not_Trouve of (int list) (*distinguer les deux cas de sortie de let*)

  (*Création d'une interruption pour notre loop, lorque notre chemin est trouvé. On a besoin de récupérer notre chemin et le cout min que l'on peut ajouter par branche "Goulot d'étranglement"*)
  (*exception  Path_Found of (((id * direction) list) * int)*)

  let find_path (gr:available_graph) source dest = 
    let rec loop_on_edge acu long visited = function
      |[] -> Not_Trouve(visited)(*Tous les noeuds sont testés, la source n'a pas été trouvée*)
      |(id,available_flow)::rest->
        if List.mem id visited then
          loop_on_edge acu long visited rest
        else if id = dest then
          let long = min available_flow long in
          Trouve(List.rev (dest::acu), long)
        (*On analyse le reste de notre liste*)
        else
          (*On met à jour notre visited*)
          match loop_on_edge acu long (id::visited) rest with
          |Trouve(l,f) -> let long = min available_flow long in
                          loop_on_edge (id::acu) long l (out_arcs gr id)
          |Not_Trouve(l1) -> let long = min available_flow long in
                            loop_on_edge (id::acu) long l1 (out_arcs gr id)
          
    in
    loop_on_edge  [source] max_int [source] (out_arcs gr source)


  (*let rec update gr long = function
    (*Si aucun noeud n'a été ajouté dans visited ou qu'il il y a un seul noeud, on renvoit le graph normal*)
    |[] -> gr
    |[(id,direction)] -> gr
    |((id1,direction1)::(id2,direction2)::rest) -> 
    (*On update notre arc si il existe*)
      let update_arc gr id1 id2 long =
        match find_arc gr id1 id2 with
        |None-> gr
        |Some (flow, capacity) -> new_arc gr id1 id2 (flow + long, capacity)
      in
      match direction2 with
      |Same -> update ( update_arc gr id1 id2 long) long rest
      |Opposite -> update( update_arc gr id2 id1 (-long)) long rest*)




  

(*Grace à notre exception on récupère donc le chemin le plus court de notre source 
à notre destination ainsi que son flot max*)


(*algorithme de ford fulkerson*)
(*Diff méthode d'erreur à tester*)
(*let ford_fulkerson gr source dest =
  (*Vérification si les noeuds de départ et d'arrivée existent ou non*)
  if (not (node_exists gr source)) || (not (node_exists gr dest)) then
      raise (Graph_error ("Source ou destination introuvable"))
  else
    let rec aux gr =
      let available_flow = get_flow_available gr in

      try 
        let _= find_path available_flow source dest in
        (*Si aucune exception n'est levée, l'algo est fini, notre graphe est complété*)
        gr 

        with(Path_Found(visited, long)) -> aux (update gr long visited)
    in
    aux gr*)
      

(*Traitement de string graph à ford fulkerson graph*)






