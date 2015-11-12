(* Starting in the top left corner of a 2×2 grid, and only being able to move
 * to the right and down, there are exactly 6 routes to the bottom right corner.
 *
 * How many such routes are there through a 20×20 grid?
 *)

(*
 * The number of routes in NxN grid is the (N 2N) combination from all 2N edges on
 * the path of N fixed only right or down edges
 *)

let routes gridDimension =
  let factorial n =
    let rec inner value count =
      if count = 0. then value
      else inner (value *. count) (count -. 1.) in
    if n >= 0. then inner 1. n
    else 0. in
  let combination n k =
    (factorial n) /. ((factorial k) *. (factorial (n -. k))) in
  combination (2. *. gridDimension) gridDimension

let () =
  print_float (routes 20.);
  print_endline ""

