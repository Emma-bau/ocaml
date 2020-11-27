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
   Printf.printf("Ford Fulkersont algortihme : \n%!");
  (*Chargement du string graphe*)
  let graph = from_file infile in
  (*conversion en int graph*)
  let graph_int = Tools.gmap graph int_of_string in
  (*conversion en flow graph*)
  let graph_init =  Ford_fulkerson.init_flow_graph graph_int in
  (*Application de l'alorithme*)
  let graph_ff = Ford_fulkerson.ford_fulkerson graph_init source sink in 

  let string_graph_ff = Tools.gmap graph_ff string_of_int in 

  let () = write_file outfile string_graph_ff in  
  
  
  

  







  


  ()

