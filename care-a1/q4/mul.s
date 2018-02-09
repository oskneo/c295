	.globl times
times:
	movl $0, %eax
	movl %esi, (%rdx)



loop:
	cmpl	$0, (%rdx)
	jle endl
	addl	%edi, %eax
	dec %rdx
	jmp loop




endl:
	ret
