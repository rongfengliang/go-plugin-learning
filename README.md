# go plugin learning

##  running

*  compile plugin

```code
go build -o ./plugin/greeter ./plugin/greeter_impl.go
```
*  compile clients

```code
go build -o basic .
```

## docker running

* build

```code
docker build -t dalongrong/go-plugin .
```

* running

```code
docker run -it dalongrong/go-plugin
```