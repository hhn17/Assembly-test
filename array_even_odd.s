	.8byte				//    PRESERVE8

	.global array_even_odd  // Export symbol

array_even_odd:             // X0 -> input array_ptr

/************Begin Implementation here**************/
	AND X1, X1, #0		// X1 = 0. Loop Counter
for_loop:
	LDUR X2, [X0]		// Get an element of the input array
	AND X3, X1, #1		// Get the least significant bit
	CBZ X3, its_odd		// Check if the current index is even or odd
	
	LSL X2, X2, #1		// If its even, left shift by one bit
	B continue
its_odd:
	RSL X2, X2, #1		// If its odd, right shift by one bit	
continue:
	STUR X2, [X0]		// Store it back
	ADD X0, X0, #8		// Move on to the next array element
	ADD X1, X1, #1		// Increment loop counter
	CMP X2, #32			// Check if we have manipulated all the elements
	B for_loop			// If not, repeat
/************End Implementation here****************/

// This returns back to C code
	BR x30