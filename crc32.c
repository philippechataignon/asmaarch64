/* Simple public domain implementation of the standard CRC32 checksum.
 * Outputs the checksum for each file given as a command line argument.
 * Invalid file names and files that cause errors are silently skipped.
 * The program reads from stdin if it is called with no arguments. */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>


/void crc32(const void *data, size_t n_bytes, uint32_t* crc) {

int main(int ac, char** av) {
  FILE *fp;
  char buf[1L << 15];
  for(int i = ac > 1; i < ac; ++i)
    if((fp = i? fopen(av[i], "rb"): stdin)) {
      uint32_t crc = 0;
      while(!feof(fp) && !ferror(fp))
	crc32(buf, fread(buf, 1, sizeof(buf), fp), &crc);
      if(!ferror(fp))
	printf("%08x%s%s\n", crc, ac > 2? "\t": "", ac > 2? av[i]: "");
      if(i)
	fclose(fp);
    }
  return 0;
}
