open Gfile
open Graph

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
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph = from_file infile in
  (* Test de clone_nodes(). *) 
  (*let graph2 = Tools.clone_nodes graph in 
  let () = write_file outfile graph2 in*)

  let graph2 = Tools.gmap graph int_of_string in

  (*rajout d'un arc de 0 à 2 de valeur x+3 donc 11*)
  let graph3 = Tools.add_arc graph2 0 2 3 in

  let graph4 = Tools.gmap graph3 string_of_int in

  let () = write_file outfile graph4 in


 



  ()
