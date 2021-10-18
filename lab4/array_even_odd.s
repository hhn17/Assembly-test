	.8byte				    //    PRESERVE8

	.global array_odd_flip  // Export symbol

array_odd_flip:             // X0 -> input array_ptr
			                // X1 -> output array_ptr

/************Begin Implementation here**************/
//task3
//assume array in x0
      orr x14, xzr, xzr      //i=1
LOOP: sub x10, x14, #32      //i=31
      cbz x10, END

      lsl x11, x14, #3       //i*8
      add x12, x0, x11      //input address
      add x13, x1, x11      //output address
      ldur x3, [x12, 0]     //load A[i]
      stur x3, [x13, 0]     //store A[i]
      ldur x3, [x12, 8]     //load A[i+1]
      add x15, xzr, xzr
      sub x15, x15, 1
      EOR x3, x3, x15   //unsigned number flip, but the print out will be like signed number
      stur x3, [x13, 8]      //store A[i+1]flip
      add x14, x14, #2        //i=i+2
      b LOOP

END:
/************End Implementation here****************/

// This returns back to C code
	BR x30
