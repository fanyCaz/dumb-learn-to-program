package greetings

import (
	"fmt"
	"errors"
	"math/rand"
	"time"
)
/*
* Como es una función sin main,
* no se puede ejecutar por si sola en consola
*/
func Hello(name string) (string,error){
	if name == ""{
		return "",errors.New("no puede")
	}
	message := fmt.Sprintf(randomGreet(),name)
	return message,nil
}

func Hellos(names []string) (map[string]string, error){
	//Dictionary is a map in Go
	messages := make(map[string]string)
	//foreach name in names
	// for index,values in the range of array
	for _, name := range names{
		message, err := Hello(name)
		if err != nil {
			return nil, err
		}
		messages[name] = message
	}
	return messages, nil
}

func init() {
	//La función init es ejecutada automáticamente
	//despues de las variables globales inicializadas
	rand.Seed(time.Now().UnixNano())
}

func randomGreet() string{
	formats := []string{
		"HI, %v. .. Bienvenidx ::",
		"Muy bien , %v .::",
		"Ta bueno %v ::",
	}
	return formats[rand.Intn(len(formats))]
}