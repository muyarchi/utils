package main

import (
	"fmt"
	"github.com/muyarchi/utils/go/morestrings"
)

func main() {
	fmt.Println("Hello go world!")
	fmt.Println("Reverse strings now")
	fmt.Println(morestrings.ReverseRunes("Whatever go!"))
}
