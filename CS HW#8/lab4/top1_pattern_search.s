.text
.global top1_pattern_search
.type top1_pattern_search, STT_FUNC

top1_pattern_search:
	stmfd sp!, {r4-r12, lr}
	mov r4, #0  //initialize Top1 count
	mov r5, #0  //initialize Top1 pattern
	mov r9, #0  //initialize Top2 count
	mov r10, #0 //initialize Top2 pattern
	mov r11, #0 //initialize Top3 count
	mov r12, #0 //initialize Top3 pattern

loop1:
	mov r6, #0
	mov r7, r0
	
loop2:
	ldrb r8, [r7], #1
	
	cmp r2, r8
	addeq r6, r6, #1
	
	cmp r7, r1
	bls loop2

	cmp r6, r4  //Compare Top1 and count
	bgt Top1    //If count is greater than Top1, go Top1
	cmp r6, r9  //Compare Top2 and count
	bgt Top2    //If count is greater than Top2, go Top2
	cmp r6, r11 //Compare Top3 and count
	bgt Top3    //If count is greater than Top3, go Top3

	b loop2ctn  //if count is not greater than Top3, continue loop2

Top1: //Top1
	mov r11, r9  //move Top2 count to Top3 Count
	mov r12, r10 //move Top2 pattern to Top3 pattern
	mov r9, r4   //move Top1 count to Top2 Count
	mov r10, r5  //move Top1 pattern to Top2 pattern
	mov r4, r6   //move count to Top1 Count
	mov r5, r2   //move pattern to Top1 pattern
	b loop2ctn   //continue loop2

Top2: //Top2
	mov r11, r9  //move Top2 count to Top3 Count
	mov r12, r10 //move Top2 pattern to Top3 pattern
	mov r9, r6   //move count to Top2 Count
	mov r10, r2  //move pattern to Top2 pattern
	b loop2ctn   //continue loop2

Top3: //Top3
	mov r11, r6 //move count to Top3 Count
	mov r12, r2 //move pattern to Top3 pattern
	b loop2ctn  //continue loop2

loop2ctn:
	cmp r2, #0xff
	addlt r2, r2, #1
	blt loop1

	str r5, [r3]       //save Top1 pattern to result[0]
	str r4, [r3, #4]   //save Top1 count to result [1]
	str r10, [r3, #8]  //save Top2 pattern to result[2]
	str r9, [r3, #12]  //save Top2 count to result [3]
	str r12, [r3, #16] //save Top3 pattern to result[4]
	str r11, [r3, #20] //save Top3 count to result [5]

	ldmfd sp!, {r4-r12, lr}

	mov pc, lr

.end
