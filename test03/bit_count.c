// count bits in a uint64_t

#include <assert.h>
#include <stdint.h>
#include <stdlib.h>

// return how many 1 bits value contains
int bit_count(uint64_t value) {
    // PUT YOUR CODE HERE
    int counter = 0;
    int pos;
    for (pos = 63; pos >= 0; pos--) {
        if (value >> pos & 1) {
            counter++;
        }
            
    }
    return counter;
}
