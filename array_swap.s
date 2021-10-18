    .8byte    
    .global array_swap  // Export symbol

array_swap:           	// X0 -> first parameter
						// X1 -> output array_ptr

/************Begin Implementation here**************/
	AND X2, X2, #0		// X2 =0
	ADD X2, X2, 31		// X2 = 31
	LSL X3, X2, #3		// X3 = 31*8
	ADD X0, X0, X3		// X0 now has the address of the last array element
for_loop:
	LDR X3, [X0]		// Get the element of the source array starting from the last element
	STR X3, [X1]		// Store it in the destination array starting from the first element
	ADD X0, X0, #-8		// Move on to the previous array element of the source array
	ADD X1, X1, #8		// Move on to the next array element of the destination array
	ADD X2, X2, #-1		// Decrement loop counter
	CMP X2, #0			// Check if we have swapped all the elements
	BGE for_loop		// If not, repeat
/************End Implementation here****************/

// This returns back to C code
    BR x30
