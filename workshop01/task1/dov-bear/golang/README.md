# on MAC
```brew install go```

# GO is a compiled language.
```
go build -o main *.go
main
```

## Docker commands
```
docker build -t syahritech/go-dov-bear:v1 .
docker run -d -p 8080:3000 syahritech/go-dov-bear:v1
docker push syahritech/go-dov-bear:v1
```