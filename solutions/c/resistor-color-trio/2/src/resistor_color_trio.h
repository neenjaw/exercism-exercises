#ifndef RESISTOR_COLOR_TRIO_H
#define RESISTOR_COLOR_TRIO_H

#include <stdint.h>
#include <stddef.h>

typedef enum {
  BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE
  } resistor_band_t;

typedef enum {
  OHMS = 1,
  KILOOHMS = 1000
  } resistor_unit_t;

typedef struct {
  uint16_t value;
  resistor_unit_t unit;
} resistor_value_t;

resistor_value_t color_code(resistor_band_t *colors);

#endif
