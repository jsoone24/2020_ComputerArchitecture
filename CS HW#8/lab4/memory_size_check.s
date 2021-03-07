.text
.global memory_size_check
.type memory_size_check, STT_FUNC

memory_size_check:
	stmfd sp!, {r4-r6}
	mov r2, #0x55
	mov r3, #0xaa

	mov r4, r0
	mov r5, #0

loop:
	strb r2, [r4]
	ldrb r6, [r4]
	cmp r2, r6
	bne exit
	strb r3, [r4]
	ldrb r6, [r4]
	cmp r3, r6
	bne exit
	add r5, r5, #1
	add r4, r4, #1
	cmp r1, r4
	bhi loop

exit:
	mov r0, r5
	ldmfd sp!, {r4-r6}
	mov pc, lr

.end
