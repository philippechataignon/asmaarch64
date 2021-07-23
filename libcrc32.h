uint32_t crc32_for_byte(uint32_t r) ;
uint32_t crc32_hw1(const uint8_t *buf, size_t size, uint32_t crc);
uint32_t crc32_hw2(const uint8_t *p, size_t len, uint32_t crc);
uint32_t crc32_ver1(const uint8_t *data, size_t n_bytes, uint32_t crc);
uint32_t crc32_ver2(const uint8_t *buf, size_t size, uint32_t crc);
uint32_t crc32_ver3(const uint8_t *message, size_t size,  uint32_t crc);
