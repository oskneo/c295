	.globl sum_float

	# var map:
	#   %xmm0:  total
	#   %rdi:   F[n] (base pointer)
	#   %rsi:   n
	#   %rbp:   endptr

sum_float:
	push	%rbp

	xorps	%xmm0, %xmm0            # total <- 0.0
	leaq	(%rdi, %rsi, 4), %rbp   # endptr <- F + n
	xorps	%xmm1, %xmm1
	movl	$0, %ecx
	jmp	loop

addingtwo:
	addss	%xmm1, %xmm0
	movl	$0, %ecx
	xorps	%xmm1, %xmm1
	jmp	loop


loop:
	cmpq	%rdi, %rbp             
	jle	endloop                 # while (F < endptr) {
	addss	(%rdi), %xmm1
	add		$4, %rdi
	addl	$1, %ecx
	cmpl	$2, %ecx
	je		addingtwo

	          
	jmp	loop                    

endloop:
	pop	%rbp
	ret

