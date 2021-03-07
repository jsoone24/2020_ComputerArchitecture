.text
.global factorial

factorial:	
	push	{r4,lr}
	mov  	r4, r0             
Loop:                                         
	sub	r4, r4, #1
        mul	r0, r4, r0
        cmp 	r4, #1
        bgt 	Loop
					
	pop	{r4, pc}
.end
		
