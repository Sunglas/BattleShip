
.POSIX:

SRC = ./src/main.cpp ./src/functions.cpp ./src/classes.cpp
CC = clang++
CPPFLAGS = -Wconversion -Wall -Wextra -pedantic -lncursesw --std=c++2b
DEBUG = ./build/debug/a.out
RELEASE = ./build/release/release.out

all: options build

options:
	@echo game build options:
	@echo "CC	= $(CC)"
	@echo "CPPFLAGS	= $(CPPFLAGS)"

run: build
	$(DEBUG)

build: format
	$(CC) $(CPPFLAGS) -Og $(SRC) -o $(DEBUG)

release: format
	$(CC) $(CPPFLAGS) -O3 $(SRC) -o $(RELEASE)

format:
	clang-format -i $(SRC) --style="{BasedOnStyle: GNU, ColumnLimit: 200}"

check:
	clang-tidy -extra-arg=-std=c++20 $(SRC)

