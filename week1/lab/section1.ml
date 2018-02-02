let rec square_all (lst : int list) : int list =
  match lst with
  | [] -> []
  | head :: tail -> (head * head) :: (square_all tail) ;;