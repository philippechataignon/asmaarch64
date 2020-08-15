#include <stdint.h>
int64_t add4(int32_t array[], int narray) {
    int64_t sum = 0;
    for (int i = 0; i < narray; i++) {
        sum += array[i];
    }
    return sum;
}
