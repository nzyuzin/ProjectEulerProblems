package main

import (
        "fmt"
        "io/ioutil"
        "strconv"
)

/*
 Find the greatest product of five consecutive digits in the 1000-digit number.
*/

func main() {
        data, _ := ioutil.ReadFile("problem8")
        seq := data[:5]
        maxProduct := 1
        var maxSequence []byte
        for i := 0; i < len(data) - 5; i++ {
                product := 1
                for _, x := range seq {
                        x, _ := strconv.Atoi(string(x))
                        product = product * int(x)
                }
                if product > maxProduct {
                        maxProduct = product
                        maxSequence = seq
                }
                seq = data[i:i+5]
        }
        fmt.Printf("The biggest product is: %v\n And the biggest sequence is: %v\n", maxProduct, string(maxSequence))
}
