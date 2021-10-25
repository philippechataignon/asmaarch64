#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>

#include "libcrc32.h"

/*
https://android.googlesource.com/platform/external/linux-kselftest/+/d97034ccdf0a13ad86f00945df245bbaf0780478/arch/arm64/crypto/crc32-arm64.c
*/
#define CRC32X(crc, value) __asm__("crc32x %w[c], %w[c], %x[v]":[c]"+r"(crc):[v]"r"(value))
#define CRC32W(crc, value) __asm__("crc32w %w[c], %w[c], %w[v]":[c]"+r"(crc):[v]"r"(value))
#define CRC32H(crc, value) __asm__("crc32h %w[c], %w[c], %w[v]":[c]"+r"(crc):[v]"r"(value))
#define CRC32B(crc, value) __asm__("crc32b %w[c], %w[c], %w[v]":[c]"+r"(crc):[v]"r"(value))
#define CRC32CX(crc, value) __asm__("crc32cx %w[c], %w[c], %x[v]":[c]"+r"(crc):[v]"r"(value))
#define CRC32CW(crc, value) __asm__("crc32cw %w[c], %w[c], %w[v]":[c]"+r"(crc):[v]"r"(value))
#define CRC32CH(crc, value) __asm__("crc32ch %w[c], %w[c], %w[v]":[c]"+r"(crc):[v]"r"(value))
#define CRC32CB(crc, value) __asm__("crc32cb %w[c], %w[c], %w[v]":[c]"+r"(crc):[v]"r"(value))

/*
http://home.thep.lu.se/~bjorn/crc/
*/

#define DEBUG 0

uint32_t crc32_for_byte(uint32_t r, uint32_t poly)
{
    if (DEBUG)
        printf("%d", r);
	for (int8_t j = 0; j < 8; ++j)
		r = r & 1 ? poly ^ r >> 1 : r >> 1;
    if (DEBUG)
        printf(" %08x\n", r);
    return r;
}

uint32_t crc32_for_byte_rev(uint32_t r, uint32_t poly)
{
    if (DEBUG)
        printf("%d", r);
	for (int8_t j = 0; j < 8; ++j)
		r = (r & 1 ? r >> 1 : poly ^ r >> 1);
    r = r ^ (uint32_t) 0xFF000000L;
    if (DEBUG)
        printf(" %08x\n", r);
    return r;
}

uint32_t crc32_ver1(const uint8_t * data, size_t n_bytes, uint32_t crc)
{
    /* compute tab one time */
    uint32_t poly = 0xEDB88320L;
    if(!*crc32_tab_ver1) {
	    for (size_t i = 0; i < 0x100; ++i) {
		    crc32_tab_ver1[i] = crc32_for_byte_rev(i, poly);
	    }
    }
	for (size_t i = 0; i < n_bytes; ++i) {
		crc = crc32_tab_ver1[(uint8_t) crc ^ data[i]] ^ crc >> 8;
	}
	return crc;
}

void crc32_create_lookup()
{
    uint32_t poly = 0xEDB88320L; // reversed 0x04C11DB7;
	size_t i = 0;
    printf("static const uint32_t crc32_tab[] = {\n");
    printf("\t");
	while (i < 0x100) {
        printf(" 0x%08x%c", crc32_for_byte(i, poly), i == 0xff ? '\n' : ',');
        i++;
        if (i % 6 == 0)
            printf("\n\t");
    }
    printf("};\n");
}

/*
https://web.mit.edu/freebsd/head/sys/libkern/crc32.c
*/
uint32_t crc32_ver2(const uint8_t * buf, size_t size, uint32_t crc)
{
	while (size--)
		crc = crc32_tab_ver2[(crc ^ *buf++) & 0xFF] ^ (crc >> 8);
	return crc;
}

uint32_t crc32_ver3(const uint8_t * message, size_t size, uint32_t crc)
{
	int64_t i;
	int8_t j;
	int32_t mask;
	for (i = 0; i < size; i++) {
		crc = crc ^ message[i];	// Get next byte.
		for (j = 7; j >= 0; j--) {	// Do eight times.
			mask = -(crc & 1);
			crc = (crc >> 1) ^ (0xEDB88320 & mask);
		}
	}
	return crc;
}

uint32_t crc32_hw1(const uint8_t * buf, size_t size, uint32_t crc)
{
	for (size_t i = 0; i < size; i++) {
		CRC32B(crc, buf[i]);
	}
	return crc;
}

/*
https://elixir.bootlin.com/linux/v4.6/source/arch/arm64/crypto/crc32-arm64.c
*/
uint32_t crc32_hw2(const uint8_t * p, size_t len, uint32_t crc)
{
	int64_t length = len;

	while ((length -= sizeof(uint64_t)) >= 0) {
		CRC32X(crc, *((uint64_t*) p));
		p += sizeof(uint64_t);
	}

	/* The following is more efficient than the straight loop */
	if (length & sizeof(uint32_t)) {
		CRC32W(crc, *((uint32_t*) p));
		p += sizeof(uint32_t);
	}
	if (length & sizeof(uint16_t)) {
		CRC32H(crc, *((uint16_t*) p));
		p += sizeof(uint16_t);
	}
	if (length & sizeof(uint8_t))
		CRC32B(crc, *((uint8_t*) p));
	return crc;
}

