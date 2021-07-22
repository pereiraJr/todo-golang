package main

import (
	"log"
	"net/http"
  "os"
	// "eddy.com/todo/data"
	"eddy.com/todo/route"
)

func main() {
	var PORT = ":9090"

	if envPort := os.Getenv("PORT"); envPort != ""{
		PORT = ":" + envPort
	}

	// data.InitDatabase()

	log.Print("Server on ", PORT)
	http.ListenAndServe(PORT, route.RegisterRoute())
}
