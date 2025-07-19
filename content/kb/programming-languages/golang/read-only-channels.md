---
title: "Read-only Channels"
---

In golang, channels can be defined as read-only, write-only or read-write.

This is an example of write-only channel:

```go
package main

import (
	"fmt"
	"math/rand"
)

func fillChannel(c chan<- int) {
	c <- rand.Intn(100)

	// Uncommenting this will result in compilation error:
	// invalid operation: cannot receive from send-only channel c (variable of type chan<- int)
	// _ = <-c
}

func main() {
	c := make(chan int)
	go fillChannel(c)
	x := <-c
	fmt.Println(x)
}
```

Similarly, example of read-only channel:

```go
func consumer(c <-chan int) {
	myVal := <-c
	fmt.Println(myVal)

	// Uncommenting this will result in compilation error:
	// invalid operation: cannot send to receive-only type <-chan int
	// c <- 100
}
```

This can be useful in cases where we want to limit possible operation on channel
passed to a function.
