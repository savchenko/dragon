PREFIX = $(HOME)/.local/bin

all: dragon

dragon: dragon.c
	$(CC) --std=c99 -Wall $(DEFINES) -fstack-protector-all -Wl,-z,relro,-z,now -D_FORTIFY_SOURCE=2 -Os -s dragon.c -o dragon `pkg-config --cflags gtk+-3.0` `pkg-config --libs gtk+-3.0`

install: dragon
	mkdir -p $(PREFIX)
	cp dragon $(PREFIX)
