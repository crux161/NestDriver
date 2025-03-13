# Makefile for building a C-shared Go library

# Variables
GO_BUILD := go build
BUILD_MODE := c-shared
OUTPUT_FILE := libcgo_test.so
SOURCE_FILE := src/main.go

# Virtual Environment
VENV_DIR := nest
ACTIVATE := source $(VENV_DIR)/bin/activate
PYTHON   := $(VENV_DIR)/bin/python

# Target: build
build:
		$(GO_BUILD) -buildmode=$(BUILD_MODE) -o $(OUTPUT_FILE) $(SOURCE_FILE)
		mv libcgo_test.so nest/libcgo_test.so
# Target: clean
clean:
		rm -f $(OUTPUT_FILE)
		rm -f libcgo_test.h
		rm -f nest/libcgo_test.so
		@[ -e _obj ] && rm -f _obj || echo "_obj not found, nothing to clean."


run:
		$(ACTIVATE) && $(PYTHON) $(VENV_DIR)/driver.py && $(VENV_DIR)/bin/deactivate

# Default target
.all: build

.PHONY: build clean all
