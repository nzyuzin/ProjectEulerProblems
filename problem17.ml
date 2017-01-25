(*
 * If the numbers 1 to 5 are written out in words: one, two, three, four, five,
 * then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 *
 * If all the numbers from 1 to 1000 (one thousand) inclusive were written out
 * in words, how many letters would be used?
 *
 * NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
 * forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
 * letters. The use of "and" when writing out numbers is in compliance with
 * British usage.
 *)

let digits = function
    1 -> "one"
  | 2 -> "two"
  | 3 -> "three"
  | 4 -> "four"
  | 5 -> "five"
  | 6 -> "six"
  | 7 -> "seven"
  | 8 -> "eight"
  | 9 -> "nine"
  | _ -> ""

let digit_name  = function
    3 -> "thir"
  | 4 -> "for"
  | 5 -> "fif"
  | 8 -> "eigh"
  | x when x >= 0 && x < 10 -> digits x
  | _ -> ""

let teens = function
    0 -> "ten"
  | 1 -> "eleven"
  | 2 -> "twelve"
  | 4 -> "fourteen"
  | x when 2 < x && x < 10 -> digit_name x ^ "teen"
  | _ -> ""

let decimals =
  function
    2 -> "twenty"
  | x when x > 2 && x < 10 -> digit_name x ^ "ty"
  | _ -> ""

let number_name n =
  let format_number hun dec dig =
    let not_empty x = not ((String.length x) = 0) in
    let formatted_hun = if (not_empty dec || not_empty dig) && not_empty hun
      then hun ^ " " else hun in
    let formatted_dec = if not_empty hun && not_empty dec then "and " ^ dec else dec in
    let formatted_dig = if not_empty dec && not_empty dig then "-" ^ dig else dig in
    formatted_hun ^ formatted_dec ^ formatted_dig in
  let digit = n mod 10 in
  let decimal = (n mod 100) / 10 in
  let hundred_s = if n >= 100 then (digits (n / 100)) ^ " hundred" else "" in
  let decimal_s = if decimal != 1
    then decimals decimal
    else teens digit in
  let digit_s = if decimal != 1 then digits digit else "" in
  (* let () = print_endline ("'" ^ hundred_s ^ "' '" ^ decimal_s ^ "' '" ^ * digit_s ^ "'") in *)
  if n == 1000 then "one thousand"
  else format_number hundred_s decimal_s digit_s

let do_n f n =
  let rec loop m =
    if m > n then
      ()
    else begin
      f m;
      loop (m + 1)
    end in
  loop 1

let () = do_n (fun x -> print_endline (number_name x)) 1000
