uint32_t crc32_for_byte(uint32_t r, uint32_t poly) ;
uint32_t crc32_for_byte_rev(uint32_t r, uint32_t poly) ;
uint32_t crc32_hw1(const uint8_t *buf, size_t size, uint32_t crc);
uint32_t crc32_hw2(const uint8_t *p, size_t len, uint32_t crc);
uint32_t crc32_ver1(const uint8_t *data, size_t n_bytes, uint32_t crc);
uint32_t crc32_ver2(const uint8_t *buf, size_t size, uint32_t crc);
uint32_t crc32_ver3(const uint8_t *message, size_t size,  uint32_t crc);
void crc32_create_lookup();

static uint32_t crc32_tab_ver1[0x100];
static const uint32_t crc32_tab_ver2[];
