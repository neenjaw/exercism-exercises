#include "resistor_color.h"

resistor_band_t *colors()
{
  static resistor_band_t c[] = {BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE};
  return c;
}

int color_code(resistor_band_t color)
{
  return color;
}