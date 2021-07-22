#include <stdio.h>
void putdec( unsigned int n ) {
    unsigned int rem  = n % 10;
    unsigned int quot = n / 10;
    if (quot > 0) putdec( quot );
    putchar( rem + '0' );
}
