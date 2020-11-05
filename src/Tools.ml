(* Yes, we have to repeat open Graph. *)
open Graph

(* assert false is of type ∀α.α, so the type-checker is happy. *)

let clone_nodes (gr: 'a graph) = n_fold gr (fun g id -> new_node g id) empty_graph


let gmap gr f = 
    let clone_gr = clone_nodes gr in
    e_fold gr (fun g1 id1 id2 lbl -> new_arc g1 id1 id2 (f lbl)) clone_gr


let add_arc g id1 id2 n = 
    match find_arc g id1 id2 with
    |None -> new_arc g id1 id2 n
    |Some x -> new_arc g id1 id2 (x+n)

    

