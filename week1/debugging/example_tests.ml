(*
                CS51:
      Tutorial on Testing Part 2  
    (adapted from Spring 2017 Lab 1)

    Note: the following tests are not comprehensive. They are simply
    here to illustrate how to write and run test cases. Also, the
    comments below are replicated in the PDF, so if you're reading
    the PDF no need to read the comments.

 *)

open Example ;;
open CS51 ;;

(* Method 1: Evaluating assertions (line by line)

  The only convenient way to run these tests is to execute the file.

  1) open up a terminal and cd to the correct directory
  2) ocamlbuild example_tests.byte
  3) ./example_tests.byte

 *)

let _ = assert (last [] = None);;
let _ = assert (last [1; 2; 3; 4] = Some 4);;
let _ = assert (last ['a'; 'b'; 'c'; 'd'] = Some 'd');;
let _ = assert (increment_lst [] = []);;
let _ = assert (increment_lst [1; 2; 4; 9] = [2; 3; 5; 10]);;
let _ = assert (increment_lst [-1; -2; -4; -9] = [0; -1; -3; -8]);;

(* Method 2: Aggregating assertions into a testing function 

  This method similar to the first method, but it groups the assertions
  together into a function. One way to run to run these tests is to
  execute the file like in the first method. If you do this, make sure
  to actually call the function in the file (currently commented out).

  Alternatively, you can run these tests in an OCaml interpreter
  (utop or ocaml), as you now have a function that you can call. This
  gives you the power to run specific groups of tests as you wish.

  1) open up a terminal and cd to the correct directory
  2) utop (or ocaml)
  3) #mod_use "example.ml";;
  4) #mod_use "cS51.ml";;
  5) #use "example_tests.ml";;
  6) test_last ();;
  7) test_increment_lst ();;

  Note: Remember to include the () in line 6! This is necessary because
  the function is of type unit -> unit, so it needs the unit input
  before the tests will run.

 *)

let test_last (() : unit) : unit =
  assert (last [] = None);
  assert (last [1; 2; 3; 4] = Some 4);
  assert (last ['a'; 'b'; 'c'; 'd'] = Some 'd');;

let test_increment_lst (() : unit) : unit =
  assert (increment_lst [] = []);
  assert (increment_lst [1; 2; 4; 9] = [2; 3; 5; 10]);
  assert (increment_lst [-1; -2; -4; -9] = [0; -1; -3; -8]);;

(*
  let _ = test_last ();;
  let _ = test_increment_lst ();;
 *)

(* Method 3: Using the CS51 "verify" function

  For the final method, we utilize a helper function from the CS51
  module that works similarly to assert, but without throwing an
  exception of failure. Instead, if false, it print's a user-supplied
  message through Printf.printf, and if true, it silently returns ().
  This way, you can continue to run tests even if one fails. You can
  also still group these tests together if you would like. In the
  example below, the "alphabet list" test case is written incorrectly,
  to illustrate how testing continues after a failure.

  To run these tests, you just execute the file like in the first method.

 *)

let test_last_verify (() : unit) : unit =
  verify (last [] = None) "empty list";
  verify (last [1; 2; 3; 4] = Some 4) "integer list";
  verify (last ['a'; 'b'; 'c'; 'e'] = Some 'd') "alphabet list";;

let test_increment_lst (() : unit) : unit =
  verify (increment_lst [] = []) "empty list";
  verify (increment_lst [1; 2; 4; 9] = [2; 3; 5; 10]) "positive list";
  verify (increment_lst [-1; -2; -4; -9] = [0; -1; -3; -8]) "negative list";;

let _ = test_last_verify ();;
let _ = test_increment_lst ();;