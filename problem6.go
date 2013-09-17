package main

/*
 * The sum of the squares of the first ten natural numbers is,
 * 1^2 + 2^2 + ... + 10^2 = 385
 *
 * The square of the sum of the first ten natural numbers is,
 * (1 + 2 + ... + 10)^2 = 55^2 = 3025
 *
 * Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
 *
 * Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 *
 */

// brute-force approach

func main() {
        const n int = 100
        sum := 0
        for i := 1; i <= n; i++ {
                for j := 1; j < i; j++ {
                        sum += i * j * 2
                }
        }
        println(sum)
}
