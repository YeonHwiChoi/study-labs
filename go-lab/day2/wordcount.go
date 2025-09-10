package main

import (
	"fmt"
	"strings"
)

func main() {
	text := "go is simple and fun fun fun"

	words := strings.Fields(text)

	wordCount := make(map[string]int)

	for _, word := range words {
		wordCount[word]++
	}

	fmt.Println("단어 빈도수 결과 :")
	
	for k, v := range wordCount {
		fmt.Printf("%s : %d\n", k, v)
	}
}