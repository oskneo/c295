	.globl sqrt
sqrt:
	movq	$15, %rcx	#It is the number to loop setting bits from 15 to 0
	movl	%edi, %r9d	#temperary storage
	movq	$0, %r8	#It is the number to be changed bit and store the answer
	leal	(,%eax,4), %eax
	jmp loop	#

decrease:
	cmpq	$0, %rcx	#if the k become zero, stop the loop and jump to endl
	je	endl
	decq	%rcx	#if not, decrease k by 1
	jmp	loop


loop:	#the main loop
	movq	$1, %rax	#let rax be the number to store result times result
	movq	$1, %rdx	#It is used to be the number to get change specific bit
	shlq	%cl, %rdx	#In order to change the specific bit, the 1 need to shift to desired position
	orq	%rdx, %r8	#Then use bitwise to change bit
	mulq	%r8	#get result times result
	mulq	%r8
	cmpq	%rax, %r9	#compare where r8 match condition of result x result < e
	jae	decrease	#if yes, jump
	movq	$1, %rdx	#rdx has been cleared, need to reassign
	shlq	%cl, %rdx
	xorq	%rdx, %r8	#then be able to change back the bit if not match condition
	jmp decrease





endl:

	movq	%r8, %rax	#assgin the final result back to rax
	ret
