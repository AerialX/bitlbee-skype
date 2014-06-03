BINARY		:= skype.so
SOURCES		:= skype.c
OBJS		:= $(SOURCES:.c=.o)

CFLAGS		:= -Wall $(shell pkg-config --cflags bitlbee) -fPIC -std=gnu99
LDFLAGS		:= $(shell pkg-config --libs bitlbee)
CC			:= gcc

all: $(BINARY)

clean:
	rm -f $(OBJS) $(BINARY)

test: $(BINARY)
	sudo cp $(BINARY) /usr/lib/bitlbee/

$(BINARY): $(OBJS)
	$(CC) -o $@ -shared $< $(LDFLAGS)

$(OBJS): $(SOURCES)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: all test clean
