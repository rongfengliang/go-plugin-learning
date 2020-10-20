all:  plugin basic
plugin:
	go build -o ./plugin/greeter ./plugin/greeter_impl.go
basic:
	go build -o basic .
run:
	./basic
