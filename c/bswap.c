#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
// #include <inttypes.h>
#include <byteswap.h>

int
main(int argc, char *argv[])
{
    uint64_t x;

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <num>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    x = strtoull(argv[1], NULL, 0);
    printf("%#" PRIx64 " ==> %#" PRIx64 "\n", x, bswap_64(x));

    exit(EXIT_SUCCESS);
}
