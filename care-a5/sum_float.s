	.globl sum_float

	# var map:
	#   %xmm0:  total
	#   %rdi:   F[n] (base pointer)
	#   %rsi:   n
	#   %rbp:   endptr

sum_float:
	push	%rbp
	

	leaq	(%rdi, %rsi, 4), %rbp   
	# endptr <- F + n
	
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	#clear xmm1 and xmm2. xmm1 is x. xmm2 is y.
	
	leaq	-8(%rsp), %rdx	
	#create a queue and let %rdx be the tail pointer of the queue

	movq	%rdx, %rbx		
	#let %rbx be the head pointer of the queue
	#now, %rdi and %rbp is the head and tail pointers of queue F to sum
	#%rbx and %rdx is the head and tail pointers of queue Q to store sums
 
	
	jmp		loop
	#start the loop


loop:
	cmpq	%rdi, %rbp             
	jle		el     
	#when F has all been dequeued, go to el for advanced check
	cmpq	%rbx, %rdx
	#if F is not empty, check whether Q is empty
	jne		compare1
	#when two queues are not empty, go to compare the head of two queues
	jmp		compare1l
	#if only Q is empty, go to dequeue F
	
el:
	movq	%rbx, %rcx
	subq	$8, %rcx
	cmpq	%rcx, %rdx
	je		endloop  
	#if F is empty and Q has only 1 element, go to end the loop 
	jmp		compare1g
	#if Q has more than 1 element, dequeue Q

	
compare1:
	xorps	%xmm0, %xmm0
	xorps	%xmm3, %xmm3
	movss	(%rdi), %xmm0
	movss	-8(%rbx), %xmm3
	ucomiss	%xmm0, %xmm3
	#use xmm0 and xmm3 to temparily store the value of heads of two queues for comparison
	jae		compare1l
	jmp		compare1g
	#dequeue the smaller one
compare1g:
	subq	$8, %rbx
	movss	(%rbx), %xmm1
	jmp second
	#Assign head of Q to x and dequeue Q and go to do the second dequeue

compare1l:
	addss	(%rdi), %xmm1
	add		$4, %rdi
	jmp		second
	#Assign head of F to x and dequeue F and go to do the second dequeue

	

second:
	cmpq	%rdi, %rbp             
	jle		compare2g 
	#if F is empty, dequeue Q
	cmpq	%rbx, %rdx
	jne		compare2
	#when two queues are not empty, go to compare the head of two queues
	jmp		compare2l
	#if only Q is empty, go to dequeue F



compare2:
	xorps	%xmm0, %xmm0
	xorps	%xmm3, %xmm3
	movss	(%rdi), %xmm0
	movss	-8(%rbx), %xmm3
	#use xmm0 and xmm3 to temparily store the value of heads of two queues for comparison
	
	ucomiss	%xmm0, %xmm3
	jae		compare2l
	jmp		compare2g
	#dequeue the smaller one
compare2g:
	subq	$8, %rbx
	movss	(%rbx), %xmm2
	jmp adding
	
	#Assign head of Q to y and dequeue Q and go to sum x and y
	
compare2l:
	addss	(%rdi), %xmm2
	add		$4, %rdi
	jmp		adding
	
	#Assign head of F to y and dequeue F and go to sum x and y
	





	
	
                    

	
	
adding:
	addss	%xmm1, %xmm2
	subq	$8, %rdx
	movss	%xmm2, (%rdx)
	#adding x and y and enqueue to Q
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	jmp 	loop
	#clear x and y and go to loop

endloop:
	movss	-8(%rbx), %xmm0
	#let %xmm0 to store the final result at the head of Q
	pop	%rbp
	ret
	#return the answer and finish the function

