.text
.global matrix         
         
matrix:
	stmfd sp!, {r0-r12,lr}

	mov		r6,#0				//s								
	mov		r7,#0				//u								
	mov		r8,#0				//v								
	mov		r9,#0				//calculated value
	ldr 	r4,[r3]				//s size
	ldr 	r5,[r3,#4]			//u size
	ldr 	r10,[r3,#8]			//v size
	
Loop:
	ldr 	r11,[r0,r6,LSL #2] 	//calculate row index
	ldr 	r12,[r11,r7,LSL #2]	//calculate column index and get value from A
	
	ldr		r11,[r1,r7,LSL #2]	//calculate row index
	ldr 	r11,[r11,r8,LSL #2]	//calculate column index and get value from B
	
	mul		r12,r11,r12			//calculate value
	add		r9,r9,r12			//store value

	add		r7,r7,#1			//increase u
	cmp		r7,r5				//compare u and u size
	bne		Loop				//if not equal branch loop
	mov		r7,#0				//reset u

	ldr 	r11,[r2,r6,LSL #2]	//calculate row index	
	str		r9,[r11,r8,LSL #2]	//calculate column index and store to C

	mov		r9,#0				//reset calculated value

	add		r8,r8,#1			//increase v
	cmp		r8, r10				//compare v and v size
	bne		Loop				//if not equal branch loop

	mov		r8,#0				//reset v

	add		r6,r6,#1			//increase s
	cmp		r6,r4				//compare s and s size
	bne		Loop				//if not equal branch loop

	ldmfd sp!, {r0-r12,pc}	//restore register
.end
