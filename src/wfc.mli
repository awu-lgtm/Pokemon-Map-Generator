(**  Main algorithm: Wave Function Collapse *)

val wfc : int * int -> int -> float array -> Adj_rules.t -> State.t
(** [wfc (x,y) num_tiles ws adj_rules] runs wfc and outputs the resulting state *)

(* exposed for testing *)
val init : int -> int -> int -> float array -> Adj_rules.t -> State.t
(** [init x y num_tiles ws adj_rules] is the initial state of wf *)
