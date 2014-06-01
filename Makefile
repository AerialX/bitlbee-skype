BINARY		:= skype.so
SOURCES		:= skype.c
OBJS		:= $(SOURCES:.c=.o)

CFLAGS		:= -Wall $(shell pkg-config --cflags bitlbee) -fPIC
LDFLAGS		:= $(shell pkg-config --libs bitlbee)

all: $(BINARY)

$(BINARY): $(OBJS)
	clang -o $@ -shared $< $(LDFLAGS)

clean:
	rm -f $(OBJS) $(BINARY)

$(OBJS): $(SOURCES)

%.o: %.c
	clang -c -o $@ $< $(CFLAGS)

.PHONY: all clean
