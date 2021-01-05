package main

import (
	"fmt"
	"log"
	"example.com/greetings"
)
//Este es el programa principal,
//si se hace un build, se crea un ejecutable
func main(){
	log.SetPrefix("error de greetings : ")
	log.SetFlags(0)
	
	names := []string{"gladys","floreida","gum"}
	message,err := greetings.Hellos(names)
	if err != nil{
		log.Fatal(err)
	}
	fmt.Println(message)
}