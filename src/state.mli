(** Representation of a state. *)

type t = {
  grid : Cell.t array array;
  heap : Cell.t Pairing_heap.t;
  stack : (Cell.t * int) Stack.t;
  w : int;
  h : int;
  mutable uncollapsed : int;
}
(** The abstract type of values representing a state. *)

type result = FINISHED of t | CONTRADICTION

val make : int -> int -> int -> float array -> Adj_rules.t -> t
(** [make x y l] is the initial unobserved state with dimensions [x] by [y] and 
    tiles initialized with [l] options *)

val make_test : int -> int -> Tile.t array -> t
(** [make_test x y l] is a state for testing purposes with dimensions [x] by [y] 
    and tiles initialized with [l] options *)

(* val smallest_entropies : t -> float array -> (int * int) list *)
(** [smallest_entropies state weights] is the list of tiles with the smallest 
    entropies from [state] *)

val smallest_entropy : t -> Cell.t option
(** [smallest_entropy state weights] is the tile with the smallest 
    entropy in [state], chooses randomly if there are multiple possibilities *)

val collapse_cell : float array -> Cell.t -> t -> unit
(** [collapse weights cell state] collapses [cell] with the smallest entropy in [state] 
with [weights] *)

val propogate : float array -> t -> result
(** [propogate state] eliminates tiles in cells of [state] that can no longer be chosen  *)

val draw : t -> int -> int -> Tile.t array -> unit
(** [draw state x y cells] renders the state to screen with bottom left corner 
    at ([x],[y])*)
