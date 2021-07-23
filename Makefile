CFLAGS=-march=armv8.1-a -O3

all: crc32

crc32: crc32.o libcrc32.a 
	gcc $(CFLAGS) -o crc32 crc32.o -L. -lcrc32

libcrc32.a: libcrc32.c 
	gcc -c $(CFLAGS) -o libcrc32.o libcrc32.c
	ar rcs libcrc32.a libcrc32.o

libs: libcrc32.a

clean:
	rm -f crc32 *.o *.a
