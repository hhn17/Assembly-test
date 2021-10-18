    .8byte    
    .global array_swap      // Export symbol

array_swap:                 // X0 -> first parameter
                            // X1 -> output array_ptr

/************Begin Implementation here**************/
//task2
//assume array in x0        //the array has already been load into address x0+offset
      orr x14, xzr, xzr     //i=0 x14
LOOP: sub x10, x14, #32     //i=32
      cbz x10, END

      lsl x11, x14, #3      //i*8
      add x12, x0, x11      //x12 input address
      add x13, x1, x11      //x13 output address

      ldur x3, [x12, 0]     //load A[i]
      stur x3, [x13, 8]     //A[i+1]=temp
      ldur x4, [x12, 8]     //load A[i+1]
      stur x4, [x13, 0]     //A[i]=A[i+1]

      ldur x3, [x12, 16]     //load A[i]
      stur x3, [x13, 16]     //storeA[i]
      ldur x4, [x12, 24]     //load A[i+1]
      stur x4, [x13, 24]     //storeA[i+1]

      add x14, x14, #4      //i=i+4
      b LOOP

END:
/************End Implementation here****************/

// This returns back to C code
    BR x30

