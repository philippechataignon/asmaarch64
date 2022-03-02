%.o: %.s
	as -o "$@" "$<"
%: %.o
	ld -o "$@" "$<"

obj = $(patsubst %.s, %.o, $(wildcard *.s)) $(patsubst %.S, %.o, $(wildcard *.S))
target = $(patsubst %.s, %, $(wildcard *.s)) $(patsubst %.S, %, $(wildcard *.S))

all:	$(target) $(obj)

clean:
	-rm -f $(target) $(obj)
