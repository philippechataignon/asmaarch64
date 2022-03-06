obj = $(patsubst %.s, %.o, $(wildcard *.s)) $(patsubst %.S, %.o, $(wildcard *.S))
exe = $(patsubst %.s, %, $(wildcard *.s)) $(patsubst %.S, %, $(wildcard *.S))
target = calc1  calc2  hello

all:$(target) $(obj)
calc1:	calc1.o calc1_main.o
calc2:	calc2.o calc2_main.o

clean:
	-rm -f $(target) $(obj)
