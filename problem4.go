/*
 * A palindromic number reads the same both ways.
 * The largest palindrome made from product of two 2-digit numbers is 9009 = 91 * 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 *
 */

package main

import "math"

func main() {
        largestPalindrome := 0
        var f, s int
        for i := 999; i >= 100; i-- {
                for j := 999; j >= i; j-- {
                        if i * j < largestPalindrome {
                                break
                        }
                        if compareDigits(i * j) {
                                f, s = i, j
                                largestPalindrome = i * j
                        }
                }
        }
        println(f, s)
        println(largestPalindrome)
}

func compareDigits(number int) bool {
        digitsCount := 0
        for i := 1; i <= number; i *= 10 {
                digitsCount++
        }
        for i, j := 10, int(math.Pow(10, float64(digitsCount))); i <= j; i, j = i * 10, j / 10 {
                headDigit := (number % j) / (j / 10)
                tailDigit := (number % i) / (i / 10)
                if headDigit != tailDigit {
                        return false
                }
        }

        return true
}

