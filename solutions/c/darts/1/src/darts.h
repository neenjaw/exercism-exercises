#ifndef DARTS_H
#define DARTS_H

#include <stdint.h>
#include <math.h>

#define SCORE_INNER_CIRCLE 10
#define SCORE_MIDDLE_CIRCLE 5
#define SCORE_OUTER_CIRCLE 1
#define SCORE_OUT_OF_BOUNDS 0

typedef struct coordinate
{
  float x;
  float y;
} coordinate_t;

uint8_t score(coordinate_t landing_position);

#endif
