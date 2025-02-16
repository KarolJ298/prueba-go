package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	// Create a new Gin router
	router := gin.Default()

	// Define a route handler for the root path
	router.GET("/", func(c *gin.Context) {
		c.String(200, "Hello, World!")
	})

	// Start the server
	router.Run(":8080")
}
