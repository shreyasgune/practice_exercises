package main

import (
	"fmt"
)

var (
	rangeVal int
	str1     string
	str2     string
)

func main() {

	rangeVal = 100
	fizBuzzer(rangeVal, "fizz", "buzz")

}

func fizBuzzer(rangeVal int, str1 string, str2 string) {
	for i := 1; i <= rangeVal; i++ {
		if i%3 == 0 && i%5 == 0 {
			fmt.Printf("%d-%s%s ,", i, str1, str2)
		} else if i%3 == 0 {
			fmt.Printf("%d-%s ,", i, str1)
		} else if i%5 == 0 {
			fmt.Printf("%d-%s ,", i, str2)
		} else {
			fmt.Println(i)
		}
	}
}
