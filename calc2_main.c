#include <stdio.h>
void calc2();
extern char* hello;
extern int length;
extern int width;
extern int perim;

int main()
{
    length = 10;
    width = 12;
    calc2();
    printf("%d\n", perim);
    return 0;
}
