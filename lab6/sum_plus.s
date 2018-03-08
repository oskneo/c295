	.globl sum_plus
sum_plus:
	xorl	%eax, %eax
	testl	%esi, %esi
	jle	done
	xorl	%edx, %edx
	shl     $2, %rsi
	movl	$0, %r8d
loop:
	movl	(%rdi,%rdx), %ecx
	testl	%ecx, %ecx
	#jle	endif
	cmovle	%r8d, %ecx

	addl	%ecx, %eax
endif:
	addq	$4, %rdx
	cmpq	%rsi, %rdx
	jne	loop
done:
	ret
