#include "resistor_color.h"

resistor_band_t *colors()
{
  static resistor_band_t c[] = {BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE};
  return c;
}

resistor_band_t color_code(enum band_color color)
{
  return color;
}