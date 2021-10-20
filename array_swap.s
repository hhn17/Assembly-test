    .8byte
    .global array_swap    // Export symbol

array_swap:           // X0 -> first parameter
                      // X1 -> output array_ptr

/************Begin Implementation here**************/
		orr x14,xzr,xzr		//i=0
		add x14,x14,#31		//i=31
		orr x9,xzr,xzr 		//j=0

LOOP:	sub x15,x9,32		//x15=j-32
		cbz x15,END			//quit when j=32

		lsl x13,x14,#3		//x13=i*8
		add x12,x0,x13		//&x12=Input_array[i]
		ldur x11,[x12,0]	//x11=Input_array[i]

		lsl x13,x9,#3		//x13=j*8
		add x12,x1,x13		//&x12=Output_array[j]
		ldur x10,[x12,0]	//x10=Output_array[j]

		add x10,x11,xzr		//x10=x11;
		stur x10,[x12,0]	//Output_array[j]=Input_array[i]

		add x9,x9,#1		//j=j+1
		sub x14,x14,#1		//i=i-1
		b LOOP


END:



/************End Implementation here****************/

// This returns back to C code
    BR x30
