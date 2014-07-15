#!/usr/bin/env ruby

=begin
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=end

require('prime')

# Somehow I feel guilty for doing that in ruby...

sum = 0

Prime.each { |p|
  break if p >= 2000000
  sum += p
}

p sum

