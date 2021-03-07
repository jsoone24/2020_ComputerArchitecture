.text
.global swap
.type swap, STT_FUNC
		  
swap: 
    LSL X10 , X1,#3
    ADD X10 , X0,X10

    LDUR X9, [X10,#0]
    LDUR X11, [X10,#8]

    STUR X11, [X10,#0]
    STUR X9, [X10,#8]
    
    BR X30
		
.end

	
