(*
                CS51:
        Tutorial on Errors
 *)

(* Function 1: fins last element in a list *)
let rec last (lst: 'a list) : 'a option =
  match lst with
  | [] -> None
  | [x] -> x
  | head :: tail -> last tail;;

(* Function 2: increments all integers in a list *)
let rec increment_lst (lst : int list) : int list =
  match lst with
  | head :: tail -> (head + 1) :: (increment_lst tail);;

(* Function 3: finds length of a given list *)  
let length (lst : 'a list) : int =
    match lst with
    | [] -> 0
    | _ :: tail -> 1 + length tail;;

(* Function 4: finds the sum of a list of floats *)
let float_sum (lst : float list) : float =
    match lst with
    | [] -> 0.0
    | head :: tail -> h + (sum tail);; 