BINARY		:= skype.so
SOURCES		:= skype.c
OBJS		:= $(SOURCES:.c=.o)

CFLAGS		:= -Wall $(shell pkg-config --cflags bitlbee) -fPIC
LDFLAGS		:= $(shell pkg-config --libs bitlbee)

all: $(BINARY)

clean:
	rm -f $(OBJS) $(BINARY)

test:
	sudo cp $(BINARY) /usr/lib/bitlbee/

$(BINARY): $(OBJS)
	clang -o $@ -shared $< $(LDFLAGS)

$(OBJS): $(SOURCES)

%.o: %.c
	clang -c -o $@ $< $(CFLAGS)

.PHONY: all test clean
