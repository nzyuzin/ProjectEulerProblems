# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
# increases by 3330, is unusual in two ways: (i) each of the three
# terms are prime, and, (ii) each of the 4-digit numbers are
# permutations of one another.  There are no arithmetic sequences made
# up of three 1-, 2-, or 3-digit primes, exhibiting this property, but
# there is one other 4-digit increasing sequence.
#
# What 12-digit number do you form by concatenating the three terms in
# this sequence?

require('prime')

primes = Prime.to_a(10000).keep_if { |p| p > 1000 }
prime_char_arrays = primes.collect { |p| p.to_s.chars.to_a }

prime_permutations = prime_char_arrays.map do |prime|
  prime.permutation.map { |perm| perm.inject(:+).to_i }.to_a.keep_if do |perm|
    primes.include?(perm)
  end.uniq.sort
end.keep_if { |p| p.size > 1 }.uniq

prime_permutations.each do |permutation|
  success = false
  permutation.each do |p|
    break if success
    permutation_diff = permutation.map { |p1| p1 - p }
    permutation_diff.each do |p1|
      next if p1 == 0
      if permutation_diff.include? p1 * 2
        success = true
        print p, p1 + p, p1 * 2 + p
        puts
        break
      end
    end
  end
end
