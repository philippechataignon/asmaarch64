#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

static inline void reverse(char *upp, char *low)
{
  upp--;
  while (upp>low) {
    char tmp = *upp;
    *upp = *low;
    *low = tmp;
    upp--;
    low++;
  }
}

void writeInt64(int64_t x, char *pch)
{
  char *ch = pch;
  if (x<0) {
      *ch++ = '-';
      x = -x;
  }
  char *low = ch;
  do {
      *ch++ = '0' + x % 10;
      x /= 10;
  } while (x>0);
  reverse(ch, low);
  pch = ch;
}

int main(int argc, char* argv[]) {
    char* ch = calloc(1024, 1);
    long int x = -3456789;
    writeInt64(x, ch);
    puts(ch);
    return(0);
}

