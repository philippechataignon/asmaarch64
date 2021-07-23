/* Simple public domain implementation of the standard CRC32 checksum.
 * Outputs the checksum for each file given as a command line argument.
 * Invalid file names and files that cause errors are silently skipped.
 * The program reads from stdin if it is called with no arguments. */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "libcrc32.h"

#define SIZE 65536

int main(int ac, char** av) {
    uint8_t buff[SIZE];
    size_t bytes;
    bytes = fread(buff, 1, SIZE, stdin);
    printf("Bytes read: %d First: %02x Last: %02x\n", bytes, buff[0], buff[8]);
    uint32_t crc = 0xffffffff;
    crc = crc32_ver3(buff, bytes, crc);
    printf("Final result: %08x\n", crc);
    return 0;
}
