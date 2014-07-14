package main

/*
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 * a2 + b2 = c2
 *
 * For example, 32 + 42 = 9 + 16 = 25 = 52.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */

// TODO: Currently, this is too crude even for brute-force. Improve.

func main() {
	limit := 1000
	a, b, c := 1, 1, 1
        steps := 0

	triplet := []int{0, 0, 0}

	for c < limit {
		a = 1
		for a < c && a + c <= limit {
			b = 1
			for b < a && a + c + b <= limit {
                                if a*a+b*b == c*c && a+b+c == limit {
                                        triplet[0] = a
                                        triplet[1] = b
                                        triplet[2] = c
                                        println(triplet[0], triplet[1], triplet[2])
                                        println(triplet[0] * triplet[1] * triplet[2])
                                        println(steps)
                                        return
                                }
                                steps++
				b++
			}
			a++
		}
		c++
	}
}
