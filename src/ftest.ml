open Gfile
open Ford_fulkerson

let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)

  (* These command-line arguments are not used for the moment. *)
  and source = int_of_string Sys.argv.(2)
  and sink = int_of_string Sys.argv.(3)
  in
  (* Open file *)
   Printf.printf("Find_path test algortihme : \n%!");
  (*Chargement du graphe*)
  let graph = from_file infile in
  let graph_int = Tools.gmap graph int_of_string in
  let graph_init =  Ford_fulkerson.init_flow_graph graph_int in
  let available_graph = Ford_fulkerson.get_flow_available graph_init in
  let ()= match Ford_fulkerson.find_path available_graph source sink with
    |Trouve (l,f) -> Printf.printf("Path : \n%!"); List.iter (fun (a:int) -> Printf.printf("%d\n") a) l; Printf.printf("Flow_max : %d\n") f
    |Not_Trouve (l)-> Printf.printf("Node visited: \n%!"); List.iter (fun a -> Printf.printf("%d\n")a) l;
  in










  (*(* Open file *)
  Printf.printf("Ford Fulkerson algortihme : \n%!");
  (*Chargement du graphe*)
  let graph = from_file_ff infile in
  (*on lui applique l'algorithme*)
  let flow_graph = Ford_fulkerson.ford_fulkerson graph _source _sink in



  (* Rewrite the graph that has been read. *)
  
  let () = write_file outfile graph in*)

  ()

