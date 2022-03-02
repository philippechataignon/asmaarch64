#include <stdio.h>

double calc(double x) {
    for(int i=0;i<4;i++) {
        x *= x * 1.2;
    }
    return x;
}
