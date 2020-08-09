// gcc -o add_test add_test.c add.s
#include <stdio.h>

void add(int a, int b, int* c);

int main() {
    int a = 3;
    int b = 4;
    int c = 0;
    add(a, b, &c);
    printf("%d\n", c);
    return 0;
}

