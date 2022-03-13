obj = $(patsubst %.s, %.o, $(wildcard *.s)) $(patsubst %.S, %.o, $(wildcard *.S))
exe = $(patsubst %.s, %, $(wildcard *.s)) $(patsubst %.S, %, $(wildcard *.S))

target = calc1  calc2  hello first add1.bin add2.bin add4.so add4b.so

all:$(target) $(obj)
calc1:	calc1.o calc1_main.o
calc2:	calc2.o calc2_main.o

add1.bin: add1.o
	objcopy -O binary add1.o add1.bin

add2.bin: add2.o
	objcopy -O binary add2.o add2.bin

add4.so: add4.s
	gcc -fpic -shared -o $@ $<

add4b.so: add4b.s
	gcc -fpic -shared -o $@ $<

clean:
	-rm -f $(target) $(obj) *.so *.o
