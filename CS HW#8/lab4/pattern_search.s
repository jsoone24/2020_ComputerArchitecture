.text
.global pattern_search
.type pattern_search, STT_FUNC

pattern_search:
	push {r4, r5, lr}
	mov r3, #0
	ldr r5, =0x0000ffff

loop:
	ldr r4, [r0], #2
	and r4, r4, r5
	cmp r4, r2
	addeq r3, r3, #1
	subne r0, r0, #1
	cmp r0, r1
	bls loop
	mov r0, r3

	pop {r4, r5, pc}

.end
