#ifndef RESISTOR_COLOR_H
#define RESISTOR_COLOR_H

// #define BLACK 0
// #define BROWN 1
// #define RED 2
// #define ORANGE 3
// #define YELLOW 4
// #define GREEN 5
// #define BLUE 6
// #define VIOLET 7
// #define GREY 8
// #define WHITE 9

typedef unsigned int resistor_band_t;

enum band_color {BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE};

int *colors();
int color_code(enum band_color color);

#endif
