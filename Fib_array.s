	.8byte				//    PRESERVE8

	.global Fib_array	// Export symbol

Fib_array:           	// X0 -> first parameter

/************Begin Implementation here**************/
	
	AND X1, X1, #0		// X1 = 0
	STR X1, [X0]		// Fib[0] = 0	(First element)
	ADD X1, X1, #1		// X1 = 1
	STR X1, [X0, #8]	// Fib[1] = 1	(Second element)
	ADD X0, X0, #16		// X0 now has address of the array where to store the third element
	AND X3, X3, #0		// X3 = 0
	ADD X3, X3, #30		// X3 = 30. It will serve as the loop counter
for_loop:				// Loop to initialize rest of the 30 elements of the Fibonacci Sequence
	LDR X1, [X0, #-8]	// Get Fib[i-1]		
	LDR X2, [X0, #-16]	// Get Fib[i-2]
	ADD X1, X2, X1		// Find Fib[i] + Fib[i-2]
	STR X1, [X0]		// Store it in the array
	ADD X0, X0,#8		// Move on to the next element of the array
	ADD X3, X3, #-1		// Decrement loop counter
	CMP X3, #0			// Check if we initialzie the remaining 30 elements
	BNE for_loop		// If not, repeat
/************End Implementation here****************/

// This returns back to C code
	BR x30