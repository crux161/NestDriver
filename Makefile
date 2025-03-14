# Makefile for building a C-shared Go library with submodule C libraries

# Variables
GO_BUILD := go build
BUILD_MODE := c-shared
OUTPUT_FILE := libcgo_test.so
SOURCE_FILE := src/main.go

# Virtual Environment
VENV_DIR := nest
ACTIVATE := source $(VENV_DIR)/bin/activate
PYTHON := $(VENV_DIR)/bin/python

# Submodule C Libraries
SUB_NOGO_DIR := nogo
SUB_NOGO_LIB := libnogo.so

# Target: build
build: $(VENV_DIR)/$(SUB_NOGO_LIB) $(VENV_DIR)/$(SUB_NOGO_LIB)
		$(GO_BUILD) -buildmode=$(BUILD_MODE) -o $(OUTPUT_FILE) $(SOURCE_FILE)
		cp $(OUTPUT_FILE) $(VENV_DIR)/$(OUTPUT_FILE)

# Target: clean
clean:
		rm -f $(OUTPUT_FILE)
		rm -f libcgo_test.h
		rm -f $(VENV_DIR)/$(OUTPUT_FILE)
		rm -f $(VENV_DIR)/$(SUB_NOGO_LIB)
		@[ -e _obj ] && rm -f _obj || echo "_obj not found, nothing to clean."
		$(MAKE) -C $(SUB_NOGO_DIR) clean

# Target: run
run:
		$(ACTIVATE) && $(PYTHON) $(VENV_DIR)/driver.py && $(VENV_DIR)/bin/deactivate

# Submodule Build Targets
$(VENV_DIR)/$(SUB_NOGO_LIB):
		$(MAKE) -C $(SUB_NOGO_DIR)
		cp $(SUB_NOGO_DIR)/$(SUB_NOGO_LIB) $(VENV_DIR)/$(SUB_NOGO_LIB)

# Default target
.all: build

.PHONY: build clean run all
