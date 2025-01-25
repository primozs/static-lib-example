# https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
# https://caiorss.github.io/C-Cpp-Notes/compiler-flags-options.html
# -O2 optimization level
# -g debug symbols
# -p profile

CC = g++
CFLAGS = -std=c++20 -Wall -Wextra -Wfloat-equal -Wshadow -Wconversion -Wpedantic -fsanitize=undefined,address
CINCLUDE = -I./engine-static/src -L./bin -lengine

.PHONY: all
all: ./bin/program

.PHONY: init
init:
	mkdir -p bin

./bin/program: init build_lib
	@echo "Build app"
	${CC} -ggdb ${CFLAGS} app/src/main.cpp ${CINCLUDE} -o $@

.PHONY: release
release: init build_lib
	@echo "Build release app"
	${CC} -O2 -DNDEBUG ${CFLAGS} app/src/main.cpp ${CINCLUDE} -o ./bin/release

.PHONY: build_lib
build_lib: ./bin/engine.o ./bin/libengine.a
	@echo "Build lib"

# compile library source code
./bin/engine.o: engine-static/src/engine.cpp
	@echo "Compiling engine"
	${CC} ${CFLAGS} -c $< -o $@

# create static library
./bin/libengine.a: ./bin/engine.o
	@echo "Crate static library"
	ar rvs $@ $<
	# ar rcs $@ $<

.PHONY: clean
clean:
	@echo "Cleanup"
	rm -rf bin
