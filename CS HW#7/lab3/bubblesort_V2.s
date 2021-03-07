.text
.global bubblesort
.global swap
.type bubblesort, STT_FUNC

bubblesort:
		sub	sp, sp, #20
		str	lr, [sp, #16]
		str	r7, [sp, #12]
		str	r6, [sp, #8]
		str 	r3, [sp, #4]
		str	r2, [sp, #0]
		
		mov	r6, r0
		mov	r7, r1
		mov	r2, #0
		sub	r1, r1, #1

for1tst:
		cmp	r2, r1
		bge	exit1
#		sub	r3, r2, #1
		mov	r3, #0
		
for2tst:
		sub 	r1, r1, r2		
#		cmp	r3, #0
		cmp	r3, r1
		add	r1, r1, r2
#		blt	exit2
		bge	exit2
		add	r12, r0, r3, LSL #2
		ldr	r4, [r12, #0]
		ldr	r5, [r12, #4]
		cmp	r4, r5
		ble	exit2
		
		stmdb	sp!,{r0,r1,r2,r3,r12}
		mov	r0, r6
		mov	r1, r3
		bl	swap
		ldmia 	sp!,{r0,r1,r2,r3,r12}
		
#		sub	r3, r3, #1
		add	r3, r3, #1
		b	for2tst
		
exit2:
		add	r2, r2, #1
		b	for1tst
		
exit1:
		ldr	r2, [sp, #0]
		ldr	r3, [sp, #4]
		ldr	r6, [sp, #8]
		ldr 	r7, [sp, #12]
		ldr	lr, [sp, #16]		
		add	sp, sp, #20
		
		mov	pc, lr
		
.end
