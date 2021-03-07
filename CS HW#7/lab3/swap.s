.text
.global swap
.type swap, STT_FUNC
		  
swap:
	add	r12, r0, r1, lsl #2
		
	ldr	r2, [r12, #0]
	ldr	r3, [r12, #4]
		
	str	r3, [r12, #0]
	str	r2, [r12, #4]
		
	mov	pc, lr
		
.end
			
