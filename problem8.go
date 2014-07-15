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
        maxProduct := 1
        for i := 0; i < len(data) - 5; i++ {
                product := 1
                for _, x := range data[i:i+5] {
                        x, _ := strconv.Atoi(string(x))
                        product = product * int(x)
                }
                if product > maxProduct {
                        maxProduct = product
                }
        }
        fmt.Printf("%v\n", maxProduct)
}
