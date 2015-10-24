(*
 * The following iterative sequence is defined for the set of positive integers:
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 * Using the rule above and starting with 13, we generate the following sequence:
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 * It can be seen that this sequence (starting at 13 and finishing at 1)
 * contains 10 terms. Although it has not been proved yet (Collatz Problem), it
 * is thought that all starting numbers finish at 1.
 * Which starting number, under one million, produces the longest chain?
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 *)

let collatz_sequence_size n =
  let next_collatz n =
    if n mod 2 = 0 then n / 2
    else 3 * n + 1 in
  let rec inner current_n count =
    if current_n = 1 then count
    else inner (next_collatz current_n) (count + 1) in
  inner n 1

let largest_sequence upper_bound =
  let rec inner max_size max_number iter =
    if iter > upper_bound then max_number
    else
      let current_size = collatz_sequence_size iter in
      if max_size < current_size then
        inner current_size iter (iter + 1)
      else
        inner max_size max_number (iter + 1) in
  inner 0 0 1

let () =
  let largest_before_million = largest_sequence 1000000 in
  print_endline (string_of_int largest_before_million)
