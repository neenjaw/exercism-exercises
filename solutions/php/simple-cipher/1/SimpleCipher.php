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

class SimpleCipher
{   
    public readonly string $key;
    
    public function __construct(
        $key = null
    ) {
        $this->key = $key ?? self::generateRandomKey();
        $this->validateKey($this->key);
    }

    public function encode(string $plainText): string
    {
        $encoded = '';
        foreach (str_split($plainText) as $position => $letter) {
            $key_char = $this->getKeyCharAtPosition($position);
            $encoded_letter = $this->encodeLetter($key_char, $letter);
            $encoded .= $encoded_letter;
        }
        return $encoded;
    }

    public function decode(string $cipherText): string
    {
        $decoded = '';
        foreach (str_split($cipherText) as $position => $letter) {
            $key_char = $this->getKeyCharAtPosition($position);
            $decoded_letter = $this->decodeLetter($key_char, $letter);
            $decoded .= $decoded_letter;
        }
        return $decoded;
    }

    private function validateKey(string $key): void
    {
        if (strtolower($key) !== $key || is_numeric($key) || empty($key)) {
            throw new InvalidArgumentException('key must be a lower case non-empty string');
        }
    }

    private function getKeyCharAtPosition(int $position): string
    {
        return $this->key[$position % strlen($this->key)];
    }

    private function encodeLetter(string $key, string $letter): string
    {
        $offset = ord("a");
        $key_val = ord($key) - $offset;
        $letter_val = ord($letter) - $offset;
        return chr((($letter_val + $key_val) % 26) + $offset);
    }

    private function decodeLetter(string $key, string $letter): string
    {
        $offset = ord("a");
        $key_val = ord($key) - $offset;
        $letter_val = ord($letter) - $offset;
        $decoded_val = $letter_val - $key_val;

        if ($decoded_val < 0) {
            $decoded_val += 26;
        }
        return chr($decoded_val + $offset);
    }

    private static function generateRandomKey(): string
    {
        $random_key = substr(str_shuffle("abcdefghijklmnopqrstuvwxyz"), 0, 10);
        return $random_key;
    }
}
