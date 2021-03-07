.text
.global quicksort
.global swap
.type quicksort, STT_FUNC

//r0, r1, r2 = array address, first, last
//r4, r5, r6, r7, r11, r12 = array address, i, j, pivot, temp1, temp2
//r8, r9, r10 = array[i], array[j], array[pivot]

quicksort:
	stmfd sp!, {r0-r12, lr} //save register state
	
	cmp r1, r2 //if first < last, branch
	blt content
	b exit
	
content:
	mov r4, r0 //save mem address
	mov r5, r1 //initialize i
	mov r6, r2 //initialize j
	mov r7, r5 //initialize pivot
	
loop1:
	cmp r5, r6 //if i < j, branch to loop2
	ldrlt r10, [r4, r7, lsl #2] //load array[pivot] value
	bge contentexit
	
loop2:
	ldr r8, [r4, r5, lsl #2] //load array[i] value
	cmp r8, r10 //branch if array[i] <= array[pivot]
	bgt loop3 
	cmp r5, r2 //branch if i < last
	bge loop3
	add r5, r5, #1
	b loop2
	
loop3:
	ldr r9, [r4, r6, lsl #2] //load array[j] value
	cmp r9, r10 //branch if array[j] <= array[pivot]
	ble loopexit
	sub r6, r6, #1
	b loop3

loopexit:
	cmp r5, r6
	ldrlt r11, [r4, r5, lsl #2] //temp1 = array[i]
	ldrlt r12, [r4, r6, lsl #2] //temp2 = array[j]
	
	strlt r12, [r4, r5, lsl #2] //array[i] = temp2
	strlt r11, [r4, r6, lsl #2] //array[j] = temp1
	
	b loop1

contentexit:
	ldr r11, [r4, r6, lsl #2] //temp1 = array[j]
	ldr r12, [r4, r7, lsl #2] //temp2 = array[pivot]
	
	str r12, [r4, r6, lsl #2] //array[j] = temp2
	str r11, [r4, r7, lsl #2] //array[pivot] = temp1
	
	//parameter 1 = memaddress, parameter 2 = first
	mov r11, r2 //save last to temp1
	sub r2, r6, #1 //parameter 3 = j-1
	bl quicksort
	mov r2, r11 //restore last
	
	//parameter 1 = memaddress, parameter 3 = last
	mov r11, r1 //save first to temp1
	add r1, r6, #1 //parameter 2 = j+1
	bl quicksort
	mov r1, r11 //restore first
	
exit:
	ldmfd sp!, {r0-r12, pc}
	
.end