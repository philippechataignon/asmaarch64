#include <stdio.h>
#include <stdint.h>


uint16_t crc16_ccitt(char* data, unsigned int data_len) {
    // uint16_t crc = 0xFFFF;
    uint16_t crc = 0x0;
    for (unsigned int i = 0; i < data_len; ++i) {
		uint16_t dbyte = data[i];
        crc ^= dbyte << 8;

		for (unsigned char j = 0; j < 8; ++j) {
			uint16_t mix = crc & 0x8000;
			crc = (crc << 1);
			if (mix)
				crc = crc ^ 0x1021;
		}
	}
    return crc;
}

unsigned short crc16(const unsigned char* data_p, unsigned char length){
    unsigned char x;
    unsigned short crc = 0x0;
    //unsigned short crc = 0xFFFF;

    while (length--){
        x = crc >> 8 ^ *data_p++;
        x ^= x>>4;
        crc = (crc << 8) ^ ((unsigned short)(x << 12)) ^ ((unsigned short)(x <<5)) ^ ((unsigned short)x);
    }
    return crc;
}

int main() {
    char* p = "Hi!";
    printf("%x\n", crc16(p, 3));
    printf("%x\n", crc16_ccitt(p, 3));
    return 0;
}
