<?php

declare(strict_types=1);

function distance(string $strandA, string $strandB): int
{
    $distnace = 0;
    foreach ($strandA as $index => $value) {
        if ($value != $strandB[$index]) {
            $distance += 1;
        }
    }
    unset($value);

    return $distance;
}

function count($acc, $x): int
{
    return $acc + 1;
}