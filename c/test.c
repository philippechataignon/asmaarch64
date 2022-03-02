#include <stdio.h>

void calc(int a, int b) {
    int i;

    for(i=0;i<4;i++) {
      printf("%i\n", ((a * i) + b) % 5);
    }
}

void add(int a, int b, int* c) {
    *c = a + b;
}
