/* Simple public domain implementation of the standard CRC32 checksum.
 * Outputs the checksum for each file given as a command line argument.
 * Invalid file names and files that cause errors are silently skipped.
 * The program reads from stdin if it is called with no arguments. */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "libcrc32.h"

#define SIZE 65536

int main(int argc, char *argv[])
{
	uint8_t buff[SIZE];
	if (argc != 2) {
        puts("Exemple: ./crc32 4 < filein");
        return 1;
    }
	uint8_t num = atoi(argv[1]);
	size_t bytes;
	uint32_t crc = 0xffffffff;
	uint32_t(*fun)(const uint8_t *, size_t, uint32_t);
	switch (num) {
	case 1:
		fun = &crc32_ver1;
		crc = 0;
		break;
	case 2:
		fun = &crc32_ver2;
		break;
	case 3:
		fun = &crc32_ver3;
		break;
	case 4:
		fun = &crc32_hw1;
		break;
	case 5:
		fun = &crc32_hw2;
		break;
	}
	if (argc == 2) {
		while (!feof(stdin) && !ferror(stdin)) {
			bytes = fread(buff, 1, SIZE, stdin);
			crc = (*fun)(buff, bytes, crc);
		}
		if (num == 1) {
			crc = ~crc;
		}
		printf("Final result: %08x\n", ~crc);
	}
	return 0;
}
