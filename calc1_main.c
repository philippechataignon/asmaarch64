#include <stdio.h>
void calc1(int*, int*);
extern int entier;

int main()
{
    int length = 10;
    int width = 20;

    calc1(&length, &width);

    printf("%d\n", entier);
    return 0;
}
