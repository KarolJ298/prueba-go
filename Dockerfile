# Etapa de compilación
FROM golang:latest AS build


# Copiar el archivo principal al contenedor
COPY main.go /app/main.go
COPY go.mod /app/go.mod
COPY go.sum /app/go.sum

# Compilar el código en Go
WORKDIR /app
RUN go mod download
RUN go build -o main main.go

# Etapa de producción
FROM alpine

# Copiar el ejecutable compilado desde la etapa de compilación
COPY --from=build /app/main /app/main
RUN chmod +x /app/main

# Exponer el puerto 8080
EXPOSE 8080

# Ejecutar el archivo principal
CMD ["/app/main"]