(*
                CS51:
      Tutorial on Testing Part 1
 *)

(* Function 1: finds last element in a list *)
let rec last (lst: 'a list) : 'a option =
	match lst with
	| [] -> None
	| [x] -> Some x
	| _ :: tail -> last tail;;

(* Function 2: increments all integers in a list *)
let rec increment_lst (lst : int list) : int list =
  match lst with
  | [] -> []
  | head :: tail -> (head + 1) :: (increment_lst tail);;