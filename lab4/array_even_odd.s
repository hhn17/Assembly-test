	.8byte				//    PRESERVE8

	.global array_even_odd  // Export symbol

array_even_odd:             // X0 -> input array_ptr

/************Begin Implementation here**************/
				orr x14,xzr,xzr 	//i=0;	
	EVEN_LOOP:	sub x15,x14,#32 	//x15=x14-32
				cbz x15,EVEN_END
				
				lsl x13,x14,#3		//x13=i*8
				add x12,x0,x13		//x12=address of A[i]
				
				ldur x11,[x12,0]	//x11=A[i]
				lsl x11,x11,#1		//x13<<1
				stur x11,[x12,0]	//A[i]=x13
				add x14,x14,#2		//i=i+2
				b EVEN_LOOP
				
	EVEN_END:	orr x14,xzr,xzr
				orr x15,xzr,xzr
				orr x13,xzr,xzr
				orr x12,xzr,xzr
				orr x11,xzr,xzr
				
				add x14,x14,#1		//i=1
	ODD_LOOP:	sub x15,x14,#33		//x15=x14-33
				cbz x15,END			//quit if i=33
				
				lsl x13,x14,#3		//i=i*8
				add x12,x0,x13		//&x12=A[i]
				
				ldur x11,[x12,0]	//x11=A[i]
				lsr x11,x11,#1		//x11>>1
				stur x11,[x12,0]	//A[i]=x11
				add x14,x14,#2		//i=i+2
				b ODD_LOOP

	END:
/************End Implementation here****************/

// This returns back to C code
	BR x30