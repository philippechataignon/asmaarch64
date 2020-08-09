cpp -dM /usr/include/unistd.h > headers.h
cpp -dM /usr/include/asm-generic/unistd.h >> headers.h
sort headers.h|uniq -u > include.h

cpp -E hello.s > hellopp.s
as hellopp.s -o hello.o
ld hello.o -o hello
./hello
objdump -D hello.o
