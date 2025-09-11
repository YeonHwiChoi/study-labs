package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

// helloHandler: 단순 텍스트 응답
func helloHandler(w http.ResponseWriter, r *http.Request) {
	_, err := w.Write([]byte("Hello, World!"))
	if err != nil {
		http.Error(w, "응답 작성 실패", http.StatusInternalServerError)
	}
}

// countHandler: JSON 배열 입력 → 단어별 빈도수 JSON 반환
func countHandler(w http.ResponseWriter, r *http.Request) {
	var words []string
	if err := json.NewDecoder(r.Body).Decode(&words); err != nil {
		http.Error(w, "잘못된 입력(JSON 배열 필요)", http.StatusBadRequest)
		return
	}

	counts := make(map[string]int)
	for _, w := range words {
		counts[w]++
	}

	w.Header().Set("Content-Type", "application/json")
	if err := json.NewEncoder(w).Encode(counts); err != nil {
		http.Error(w, "JSON 변환 실패", http.StatusInternalServerError)
	}
}

func main() {
	http.HandleFunc("/hello", helloHandler)
	http.HandleFunc("/count", countHandler)

	fmt.Println("서버 실행 중... http://localhost:8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalf("서버 시작 실패: %v", err)
	}
}