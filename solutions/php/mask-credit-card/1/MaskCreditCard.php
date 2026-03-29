<?php

/*
 * By adding type hints and enabling strict type checking, code can become
 * easier to read, self-documenting and reduce the number of potential bugs.
 * By default, type declarations are non-strict, which means they will attempt
 * to change the original type to match the type specified by the
 * type-declaration.
 *
 * In other words, if you pass a string to a function requiring a float,
 * it will attempt to convert the string value to a float.
 *
 * To enable strict mode, a single declare directive must be placed at the top
 * of the file.
 * This means that the strictness of typing is configured on a per-file basis.
 * This directive not only affects the type declarations of parameters, but also
 * a function's return type.
 *
 * For more info review the Concept on strict type checking in the PHP track
 * <link>.
 *
 * To disable strict typing, comment out the directive below.
 */

declare(strict_types=1);

function maskify(string $cc): string
{
    $digit_positions = getCcDigitPositions($cc);

    if (count($digit_positions) < 6) {
        return $cc;
    }

    $masked = '';
    $digit_positions_to_mask = array_slice($digit_positions, 1, -4);
    for ($position_idx = 0, $cc_idx = 0; $cc_idx < strlen($cc); $cc_idx += 1) {
        $has_digits_left_to_mask = $position_idx < count($digit_positions_to_mask);
        $is_to_mask_digit = $has_digits_left_to_mask && $digit_positions_to_mask[$position_idx] === $cc_idx;
        if ($is_to_mask_digit) {
            $position_idx += 1;
            $masked .= '#';
            continue;
        }
        $masked .= $cc[$cc_idx];
    }
    return $masked;
}

function getCcDigitPositions($cc): array
{
    $digit_positions = [];

    for ($i = 0; $i < strlen($cc); $i += 1) {
        if (is_numeric($cc[$i])) {
            $digit_positions[] = $i;
        }
    }

    return $digit_positions;
}

