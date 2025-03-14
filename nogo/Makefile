CC = gcc
CFLAGS = -fPIC
LDFLAGS = -shared

SRC = nogo.c
OBJ = $(SRC:.c=.o)
LIB = libnogo.so

all: $(LIB)

$(LIB): $(OBJ)
		$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c
		$(CC) $(CFLAGS) -c -o $@ $<

clean:
		rm -f $(OBJ) $(LIB)

test: $(LIB)
		@echo "Test command placeholder. Replace with your actual test."

re: clean all test
