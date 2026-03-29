#include "resistor_color_trio.h"

resistor_value_t color_code(resistor_band_t *colors) {
  int tens = colors[0] * 10;
  int ones = colors[1];
  int scale = 1;
  for (size_t i = 0; i < colors[2]; i++)
  {
    scale *= 10;
  }
  int value = (tens + ones) * scale;

  resistor_value_t resistor;
  if (value >= KILOOHMS) {
    resistor.value = value / KILOOHMS;
    resistor.unit = KILOOHMS;
  } else {
    resistor.value = value;
    resistor.unit = OHMS;
  }

  return resistor;
}