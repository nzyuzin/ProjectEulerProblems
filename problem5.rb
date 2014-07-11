#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

$TEST_ANSWER

def answer(number)
  factors = Hash.new
  2.upto(number) do |i|
    factors_of(i).each do |pair|
      number = pair[0]
      power = pair[1]
      if factors.has_key? number
        factors[number] = power if factors[number] < power
      else
        factors[number] = power
      end
    end
  end

  result = 1
  factors.each do |e, v|
    result *= e ** v
  end
  result
end

def factors_of(number)
  require 'prime'
  div_result = Array.new
  Prime.prime_division(number)
end

def answer_correct?()
  $TEST_ANSWER = answer(10)
  $TEST_ANSWER == 2520 
end

if answer_correct?
  then puts "#{answer(20)}"
else
  # Debug only branch
  puts "Incorrect answer {#$TEST_ANSWER}!"
end

