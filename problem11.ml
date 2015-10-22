(*
 * In the 20×20 grid below, four numbers along a diagonal line have been marked
 * in red.
 *
 * 08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
 * 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
 * 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
 * 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
 * 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
 * 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
 * 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
 * 67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
 * 24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
 * 21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
 * 78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
 * 16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
 * 86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
 * 19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
 * 04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
 * 88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
 * 04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
 * 20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
 * 20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
 * 01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48
 *
 * The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
 *
 * What is the greatest product of four adjacent numbers in the same direction
 * (up, down, left, right, or diagonally) in the 20×20 grid?
 *)

(* This program can be compiled with: 
 * ocamlfind ocamlc -package extlib -package str -linkpkg problem11.ml
 * *)

open Std
open Str

let file = "problem11.grid"

let greatest_product (rows: int list list): int =

  let max_of_two a b = if a > b then a else b in

  let max_of_four a b c d =
    max_of_two (max_of_two a b) (max_of_two c d) in

  let table_el (x, y) =
    List.nth (List.nth rows x) y in

  let product_horz (x, idx) =
    if idx < 3 then
      0
  else
    let row = List.nth rows x in
    let fourth = List.nth row (idx - 3) in
    let third = List.nth row (idx - 2) in
    let second = List.nth row (idx - 1) in
    let first = List.nth row idx in
    first * second * third * fourth in

  let product_vert (x, y) =
    if x > List.length rows - 4 then
      0
    else
      let first = table_el (x, y) in
      let second = table_el (x + 1, y) in
      let third = table_el (x + 2, y) in
      let fourth = table_el (x + 3, y) in
      first * second * third * fourth in

  let product_rdiag (x, y) =
    let xOutOfBounds = x > List.length rows - 4 in
    let yOutOfBounds = y > List.length (List.nth rows x) - 4 in
    if xOutOfBounds || yOutOfBounds  then
      0
    else
      let first = table_el (x, y) in
      let second = table_el (x + 1, y + 1) in
      let third = table_el (x + 2, y + 2) in
      let fourth = table_el (x + 3, y + 3) in
      first * second * third * fourth in

  let product_ldiag (x, y) =
    let xOutOfBounds = x > List.length rows - 4 in
    let yOutOfBounds = y < 3 in
    if xOutOfBounds || yOutOfBounds  then
      0
    else
      let first = table_el (x, y) in
      let second = table_el (x + 1, y - 1) in
      let third = table_el (x + 2, y - 2) in
      let fourth = table_el (x + 3, y - 3) in
      first * second * third * fourth in

  let rec iter_by_row x max =

    let rec iter_by_col y max_in_row =
      if y >= List.length rows then
        max_in_row
    else
      let hor = product_horz (x, y) in
      let ver = product_vert (x, y) in
      let ldiag = product_ldiag (x, y) in
      let rdiag = product_rdiag (x, y) in
      let current_prod = max_of_four hor ver ldiag rdiag in
      iter_by_col (y + 1) (max_of_two current_prod max_in_row) in

    if x >= List.length rows then
      max
      else
        let row_max = iter_by_col 0 0 in
        iter_by_row (x + 1) (max_of_two row_max max) in

  iter_by_row 0 0

let () =
  let grid_file  = input_list (open_in file) in
  let split_ints lst = List.map int_of_string (Str.split (Str.regexp " ") lst) in
  let grid_rows = List.map split_ints grid_file in
  print (greatest_product grid_rows)
