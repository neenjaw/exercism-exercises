#ifndef GRAINS_H
#define GRAINS_H

#include <stdint.h>

#define GRAINS_DOES_NOT_EXIST 0
#define FIRST_SQUARE_GRAIN_VALUE 1
#define BOARD_MIN 1
#define BOARD_MAX 64

uint64_t square(uint8_t index);
uint64_t total(void);

#endif
