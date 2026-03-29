#include "resistor_color.h"

int *colors()
{
  static int c[] = {BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE};
  return c;
}

int color_code(int color)
{
  return color;
}