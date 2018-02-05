## Folders ##

SRC_DIR := src
INCLUDE_DIR := include
BUILD_DIR := build
BIN_DIR := bin

## Commands and compile settings ##

FMT = clang-format -i -style=file
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Werror -g
# Uncomment the following to compile in debug mode with no optimizations
# (for instance, this is useful to better track memory leaks):
# DFLAGS = -g -O0
IPATHS = -I$(INCLUDE_DIR)
LPATHS = -L$(INCLUDE_DIR)
# LDFLAGS =


## Files and resources ##

HPP_FILES := $(shell find $(INCLUDE_DIR) -type f -name "*.hpp")
CPP_FILES := $(shell find $(SRC_DIR) -type f -name "*.cpp")
OBJ_FILES := $(patsubst $(SRC_DIR)%,$(BUILD_DIR)%,$(CPP_FILES:.cpp=.o))

## Phony targets ##

.PHONY: all format compile run check clean

## Entry point ##

all: run

## Targets ##

format:
	@echo "$@ ..."
	$(foreach f,$(HPP_FILES),$(FMT) $(f) ;)
	$(foreach f,$(CPP_FILES),$(FMT) $(f) ;)

compile: $(BIN_DIR) $(BUILD_DIR) run-cnn

$(OBJ_FILES): $(BUILD_DIR)%.o: $(SRC_DIR)%.cpp
	$(CXX) $(CXXFLAGS) $(DFLAGS) $(IPATHS) -o $@ -c $<

run-cnn: $(OBJ_FILES)
	$(CXX) $(CXXFLAGS) $(DFLAGS) $(IPATHS) $(LPATHS) $(OBJ_FILES) -o $(BIN_DIR)/$@ $(LDFLAGS)

run: compile 
	@echo "$@ ..."
	@echo ""
	@$(BIN_DIR)/run-cnn
	@echo ""

check: compile
	@echo "$@ ..."
	@echo ""
	valgrind --tool=memcheck --leak-check=yes $(BIN_DIR)/run-cnn
	@echo ""

clean:
	@echo "$@ ..."
	$(shell find . -type f -name "run-cnn" -delete)
	$(shell find . -type f -name "*.o" -delete)
	$(shell find . -type f -name "*.a" -delete)
	$(shell find . -type f -name "*.so" -delete)

$(BIN_DIR):
	mkdir $@

$(BUILD_DIR):
	mkdir $@
