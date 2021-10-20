	.8byte				//    PRESERVE8

	.global Fib_array	// Export symbol

Fib_array:           // X0 -> first parameter

/************Begin Implementation here**************/
			orr x14,xzr,xzr   	//i=0;
			orr x12,xzr,xzr
			add x12,x0,#8

			ldur x9,[x0,0]		//x9=A[0]
			add x9,xzr,xzr    	//x9=0;
			stur x9,[x0,0]		//A[0]=0


			ldur x10,[x0,8]	//x10=A[1]
			add x10,xzr,xzr
			add x10,x10,#1		//x10=1;
			stur x10,[x0,8]   	//A[1]=1

			orr x11,xzr,xzr
			orr x12,xzr,xzr
			orr x13,xzr,xzr
			orr x15,xzr,xzr    	//reset reg to 0

			add x14,xzr,xzr
			add x14,x14,#2		//i=2;
	LOOP: 	sub x15,x14,#32		//x15=i-32
			cbz x15,END 		//if (i==32) End loop


			add x11,x10,x9		//x11=A[i-2]+A[i-1]
			add x9,xzr,x10		//x9=A[i-1]
			add x10,xzr,x11		//x10=A[i]

			orr x11,xzr,xzr		//reset x11=0
			lsl x13,x14,#3		//x13=i*8
			add x12,x0,x13 		//x12=address of A[i]

			ldur x11,[x12,0]	//load A[i] to x11
			add x11,xzr,x10		//x11=A[i]+0
			stur x11,[x12,0]	//store x11 back to A[i] memory adress

			add x14,x14,#1		//i=i+1
			b LOOP

	END:
/************End Implementation here****************/

// This returns back to C code
	BR x30

