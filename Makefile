CC = g++
CFLAGS = -std=c++23 -Wall -Wextra -Wshadow -Wconversion -Wpedantic -fsanitize=undefined,address

.PHONY: all
all: ./bin/program

.PHONY: init
init:
	mkdir -p bin

./bin/program: init build_lib
	@echo "Build app"
	${CC} ${CFLAGS} app/src/main.cpp -o $@

.PHONY: build_lib
build_lib: ./bin/engine.o ./bin/engine.a
	@echo "Build lib"

# compile library source code
./bin/engine.o: engine-static/src/engine.cpp
	@echo "Compiling engine"
	${CC} ${CFLAGS} -c $< -o $@

# create static library
./bin/engine.a: ./bin/engine.o
	@echo "Crate static library"
	ar rcs $@ $<

.PHONY: clean
clean:
	@echo "Cleanup"
	rm -rf bin
