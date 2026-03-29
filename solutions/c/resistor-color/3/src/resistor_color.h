#ifndef RESISTOR_COLOR_H
#define RESISTOR_COLOR_H

typedef unsigned int resistor_band_t;

enum band_color {BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE};

resistor_band_t *colors();
resistor_band_t color_code(enum band_color color);

#endif
