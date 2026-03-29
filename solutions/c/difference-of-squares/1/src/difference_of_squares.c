#include "difference_of_squares.h"

unsigned int square_of_sum(unsigned int number)
{
	unsigned int sum = 0;
	for (unsigned int i = 1; i <= number; i++)
	{
		sum += i;
	}
	return sum*sum;
}

unsigned int sum_of_squares(unsigned int number)
{
	unsigned int sum = 0;
	for (unsigned int i = 1; i <= number; i++)
	{
		sum += i*i;
	}
	return sum;
}

unsigned int difference_of_squares(unsigned int number)
{
	unsigned int sum = 0;
	unsigned int sum_squares = 0;
	for (unsigned int i = 1; i <= number; i++)
	{
		sum += i;
		sum_squares += i*i;
	}
	return (sum*sum) - sum_squares;
}