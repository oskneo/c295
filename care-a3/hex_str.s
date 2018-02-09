	.globl hex_str
hex_str:
	movl	%edi, %eax
	movq	$0,	(%rsi)
	movl	$0,	%r9d
	movq	$0, %rsp
	movq	%rsi, %rcx

ToAsc:
	cmpl	$1, %eax
	jle	ToRef
	movl	$0, %edx
	movl	$10, %r8d

	divl	%r8d
	addl	$48, %edx
	#pushq	%rdx
	#addq	$4, %r10
	#incl	%r9d

	#jmp	ToAsc



ToRef:
	#movq	%rsp, (%rcx)
	#addq	$4, %rsp


	movb	$49, (%rcx)
