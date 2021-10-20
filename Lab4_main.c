#include <stdio.h>

/* Declare the assembly function */
extern void Fib_array(long *array);
extern void array_swap(long *A, long *Y);
extern void array_even_odd(long *A);

int main()
{
  long array[32];		/* Part 1 - array will contain the specified initial sequence */
  long swap[32];		/* Part 2 - array will have swapped every other pair of indices */
  long odd[32];         /* Part 3 - array will swap the content of odd indices */

  int i;

  /*Part 1 fib array*/
  Fib_array(array);

  for (i = 0; i < 32; i++)
  {
	  printf("%ld, ", array[i]);
  }
  printf("\n\n");



  array_swap(array, swap);


   for (i = 0; i < 32; i++)
   {
       printf("%ld, ", swap[i]);
   }
   printf("\n\n");


  array_swap(array, odd);


  array_even_odd(odd);


  for (i = 0; i < 32; i++)
  {
      printf("%ld, ", odd[i]);
  }
  printf("\n");

  return (0);
}


