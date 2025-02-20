(* Read a graph from a file,
 * Write a graph to a file. *)

open Graph
open Ford_fulkerson

type path = string

(* Values are read as strings. *)
val from_file: path -> string graph

(* Similarly, we write only a string graph.
 * If necessary, use gmap (to be written by you) to prepare the input graph. *)
val write_file: path -> string graph -> unit

val export: path->string graph->unit


