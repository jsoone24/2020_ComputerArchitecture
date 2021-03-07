.text
.global bubblesort
.global swap
.type bubblesort, STT_FUNC

bubblesort:
	    SUB SP, SP,#56
	    STUR X30, [SP,#32]
	    STUR X22, [SP,#24]
	    STUR X21, [SP,#16]
            STUR X20, [SP,#8]   
	    STUR X19, [SP,#0]
	    
	    MOV X21, X0
	    MOV X22, X1
	    MOV X19, #0

	for1tst:
	    CMP X19, X1
	    B.GE exit1

	    SUB X20, X19, #1

	for2tst:
	    CMP X20, #0
	    B.LT exit2
	    LSL X10, X20, #3
	    ADD X11, X0, X10
	    LDUR X12, [X11,#0]
	    LDUR X13, [X11,#8]
	    CMP X12, X13
	    B.LE exit2

            
            STUR X10, [SP,#56]
            STUR X1, [SP,#48]   
	    STUR X0, [SP,#40]

	    
	    MOV X0, X21
	    MOV X1, X20
	    BL  swap
            
            LDUR X0, [SP,#40]
	    LDUR X1, [SP,#48]
	    LDUR X10, [SP,#56]
            
	    SUB X20, X20, #1
	    B for2tst

	exit2:
	    ADD X19, X19, #1
	    B for1tst

	exit1:
	    LDUR X19, [SP,#0]
	    LDUR X20, [SP,#8]
	    LDUR X21, [SP,#16]
	    LDUR X22, [SP,#24]
	    LDUR X30, [SP,#32]
	    ADD SP, SP, #56

	    BR X30
		
.end
