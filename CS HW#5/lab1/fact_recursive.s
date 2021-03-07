.text
.global factRecursive
	
factRecursive:
	sub  	sp, sp, #8         
	str  	lr, [sp, #4]     
	str  	r0, [sp, #0]      
	cmp  	r0, #1           
	bge  	loop
	mov  	r0, #1        
	add  	sp, sp, #8    
	mov  	pc,lr         
loop:
	sub  	r0, r0, #1   
	bl   	factRecursive          
	mov  	r12, r0       
	ldr  	r0, [sp, #0]  
	ldr  	lr, [sp, #4]  
	add  	sp, sp, #8   
	mul  	r0, r12, r0   
	mov  	pc, lr      
.end
		
