# -*- coding: utf-8 -*-
# It was proposed by Christian Goldbach that every odd composite
# number can be written as the sum of a prime and twice a square.
#
# 9 = 7 + 2×1^2
# 15 = 7 + 2×2^2
# 21 = 3 + 2×3^2
# 25 = 7 + 2×3^2
# 27 = 19 + 2×2^2
# 33 = 31 + 2×1^2
#
# It turns out that the conjecture was false.
#
# What is the smallest odd composite that cannot be written as the sum
# of a prime and twice a square?

require('prime')

holds = true
i = 1
while holds do
  i += 2
  next if Prime.prime? i
  holds = false
  1.upto(Math.sqrt(i / 2)) do |j|
    if Prime.prime?(i - 2 * j * j)
      holds = true
      #puts i.to_s + " = " + (i - 2 * j * j).to_s + " + 2 * " + j.to_s + "^2"
      break
    end
  end
end

p i
