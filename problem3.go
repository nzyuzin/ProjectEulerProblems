/* 
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 *
 */

package main

import "math"

func main() {
        var number int64 = 600851475143
        maxDivisor := int64(1)
        if number % 2 == 0 {
                maxDivisor = 2
                for number % 2 == 0 {
                        number /= 2
                }
        }
        for  i := int64(3); i <= int64(math.Sqrt(float64(number))); i += 2 {
                if number % i == 0 {
                        maxDivisor = i
                        for number % i == 0 {
                                number /= i
                        }
                }
        }
        if number != 1 {
                maxDivisor = number
        }
        println(maxDivisor)
}
