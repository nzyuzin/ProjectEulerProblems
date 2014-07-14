#!/usr/bin/env ruby

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
# What is the 10 001st prime number?

# Scripting languages are making me too lazy to write real implementation

def give_answer(prime_number)
  require('prime')
  prime_count = 1
  Prime.each do |prime|
    prime_count = prime_count.succ
    if prime_count > prime_number then
      return prime
    end
  end

end

def test_answer()
  require('test/unit/assertions')
  extend(Test::Unit::Assertions)
  assert_equal(13, give_answer(6))
  true
end

if test_answer then
  p give_answer(10001)
end

