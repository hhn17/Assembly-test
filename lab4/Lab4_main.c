#include <stdio.h>

/* Declare the assembly function */
extern void array_sequence(long *array);
extern void array_swap(long *A, long *B);
extern void array_odd_flip(long *A, long *B);

int main()
{
	long array[32];		/* Part 1 - array will contain the specified initial sequence */
	long swap[32];		/* Part 2 - array will have swapped every other pair of indices */

  /* Part 3 - array will swap the content of odd indices */
	long odd[32];
	int i;

	array_sequence(array);

	/* Uncomment this line to call Part 2 assembly function*/
	array_swap(array, swap);

	/* Uncomment this line to call Part 3 assembly function*/
	array_odd_flip(swap,odd);

	for (i = 0; i < 32; i++)
	{
		printf("%ld, ", array[i]);
	}
	printf("\n");


	/* Uncomment the following lines to print out Part 2 array */
	for (i = 0; i < 32; i++)
	{
		printf("%ld, ", swap[i]);
	}
	printf("\n");


  /* Uncomment the following lines to print out Part 3 array */
	for (i = 0; i < 32; i++)
	{
		printf("%ld, ", odd[i]);
	}
	printf("\n");


  return (0);
}
