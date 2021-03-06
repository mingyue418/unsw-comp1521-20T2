#include "bit_rotate.h"

// return the value bits rotated left n_rotations
uint16_t bit_rotate(int n_rotations, uint16_t bits) {
    n_rotations = n_rotations % 16;
    if (n_rotations > 0) {
        uint16_t n1 = bits << n_rotations;
        uint16_t n2 = bits >> (16 - n_rotations);
        return n1 | n2;
    } else {
        uint16_t n1 = bits >> (-n_rotations);
        uint16_t n2 = bits << (16 + n_rotations);
        return n1 | n2;
    }
     
}
