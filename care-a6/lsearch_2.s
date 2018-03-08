	.file	"lsearch_2.c"
	.text
	.globl	lsearch_2
	.type	lsearch_2, @function
lsearch_2:
.LFB0:
	.cfi_startproc
	movl	$-1, %eax
	testl	%esi, %esi
	jle	.L2
	cmpl	(%rdi), %edx
	je	.L6
	addq	$4, %rdi
	movl	$0, %eax
	jmp	.L3
.L4:
	addq	$4, %rdi
	cmpl	%edx, -4(%rdi)
	je	.L2
.L3:
	addl	$1, %eax
	cmpl	%eax, %esi
	jne	.L4
	movl	$-1, %eax
	ret
.L6:
	movl	$0, %eax
.L2:
	rep ret
	.cfi_endproc
.LFE0:
	.size	lsearch_2, .-lsearch_2
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
