#include <stdio.h>
void calc2();
extern char hello[];
extern int length;
extern int width;
extern int perim;
extern int entier;

int main()
{
    length = 10;
    width = 12;
    calc2();
    printf("%s %d %d\n", hello, entier, perim);
    return 0;
}
