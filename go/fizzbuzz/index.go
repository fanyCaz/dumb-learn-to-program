package main

import (
	"fmt"
	"strconv"
)

func main() {
	fmt.Println("hellooo")
	iterations := 30
	output := ""
	for i := 1; i <= iterations; i++ {
		output = strconv.Itoa(i)
		if i%3 == 0 {
			output = "Fizz"
		}
		if i%5 == 0 {
			output += "Buzz"
		}

		fmt.Println(output)
	}
}
