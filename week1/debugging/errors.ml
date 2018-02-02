(*
                CS51:
        Tutorial on Errors
 *)

(* Function 1: increments all integers in a list *)
let rec increment_lst (lst : int list) : int list =
  match lst with
  | head :: tail -> (head + 1) :: (increment_lst tail);;

(* Function 2: finds length of a given list *)  
let length (lst : 'a list) : int =
    match lst with
    | [] -> 0
    | head :: tail -> 1 + length tail;;

(* Function 3: finds the sum of a list of floats *)
let float_sum (lst : float list) : float =
    match lst with
    | [] -> 0.0
    | head :: tail -> h + (sum tail);; 