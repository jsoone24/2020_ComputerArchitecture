.text
.global example3
.type example3, STT_FUNC

example3: 
	sub	sp, sp, #12
	str r3, [sp, #0]
	str r4, [sp, #4]
	str r5, [sp, #8]

	sub sp, sp, #16
	mov r3, #1
	str r3, [sp, #0]

	mov r4, #2
	str r4, [sp], #4

	mov r4, #0
	str r4, [sp]

	mov r5, #3
	str r5, [sp, #8]!

	mov r3, #4
	mov r0, #-1
	str r3, [sp, r0, lsl #2]

	add sp, sp, #16
	ldr r3, [sp, #0]
	ldr r4, [sp, #4]
	ldr r5, [sp, #8]

	add sp, sp, #12

	mov pc, lr

	.end
