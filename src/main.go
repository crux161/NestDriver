package main

import "C"

import (
    "fmt"
)

func main() {

}

//export hello
func hello() {
   fmt.Println("\t@ Hello from libcgo_test!") 
}

//export greet
func greet(namePtr *C.char){
    name := C.GoString(namePtr)
    fmt.Println("\t@ Hello", name)
}
