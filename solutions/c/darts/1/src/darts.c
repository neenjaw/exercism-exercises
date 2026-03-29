#include "darts.h"

uint8_t score(coordinate_t position)
{
  float distance_from_origin = sqrtf(position.x * position.x + position.y * position.y);

  if (distance_from_origin <= 1) {
    return SCORE_INNER_CIRCLE;
  } else if (distance_from_origin <= 5) {
    return SCORE_MIDDLE_CIRCLE;
  } else if (distance_from_origin <= 10) {
    return SCORE_OUTER_CIRCLE;
  }

  return SCORE_OUT_OF_BOUNDS;
}
